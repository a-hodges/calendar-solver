import time
import argparse
import calendar
from io import StringIO
from string import ascii_uppercase
from operator import getitem
from functools import partial
from datetime import date

from clingo import Control
from clingo.symbol import Symbol, Function, String, Number, SymbolType
import colorama
from colorama import Fore, Back, Style

# enable output colors on windows
colorama.init()

board = [
    ["jan", "feb", "mar", "apr", "may", "jun"],
    ["jul", "aug", "sep", "oct", "nov", "dec"],
    ["1", "2", "3", "4", "5", "6", "7"],
    ["8", "9", "10", "11", "12", "13", "14"],
    ["15", "16", "17", "18", "19", "20", "21"],
    ["22", "23", "24", "25", "26", "27", "28"],
    ["29", "30", "31"],
]

pieces = [
    ["down", "right", "right,down", "right,right", "right,right,down"], #rect
    ["down", "right", "right,down", "right,right"], # P
    ["down", "right", "right,right", "right,right,down"], # U
    ["right", "right,right", "right,right,right", "down"], # L
    ["right", "right,right", "right,right,right", "right,down"], # T
    ["right", "right,right", "down", "down,down"], # V
    ["right", "right,right", "right,right,down", "right,right,down,right"], # R
    ["right", "right,down", "right,down,down", "right,down,down,right"], # Z
]

def orient(ori: int):
    r'''
    Sets up the orientation to replace the default right and down piece orientations
    '''
    mapping = {
        1: {"right": "right", "down": "down"},
        2: {"right": "up", "down": "right"},
        3: {"right": "left", "down": "up"},
        4: {"right": "down", "down": "left"},
        5: {"right": "left", "down": "down"},
        6: {"right": "down", "down": "right"},
        7: {"right": "right", "down": "up"},
        8: {"right": "up", "down": "left"},
    }[ori]
    return partial(getitem, mapping)

def define_lp():
    output = StringIO()

    # cover
    print("#program calendar(month, day).", file=output)
    print("#show cover/2.", file=output)
    print(f"piece(1..{len(pieces)}). orientation(1..8).", file=output)  # define pieces and orientations
    for dir in ["right", "left", "up", "down"]:
        print(f":- {dir}(A,B), {dir}(A,C), B != C.", file=output)  # a space cannot have 2 spaces adjacent on the same side
    print(f"{{origin(A,B,C)}} :- piece(A), space(B), orientation(C).", file=output)  # define origin posibilities
    print(":- piece(A), not #count{B,C : origin(A,B,C)} = 1.", file=output)  # each piece must have an origin
    print("cover(B,A) :- origin(A,B,C).", file=output)  # each origin covers its space
    print(":- uncovered(A), cover(A,B).", file=output)  # each uncovered space must not be covered
    print(":- cover(A, B), cover(A, C), B != C.", file=output)  # a space cannot be covered by the same cover twice
    #print(":- space(A), not uncovered(A), not #count{B : cover(A,B)} = 1.", end="\n\n", file=output)  # each non-uncovered space must be covered
    #print(":- space(A), not uncovered(A), not cover(A,_).", end="\n\n", file=output)  # each non-uncovered space must be covered

    # uncovered
    print("uncovered(month). uncovered(day).", end="\n\n", file=output)

    # board
    for row in board:
        out = []
        for space in row:
            out.append(f"space({space}).")
        print(*out, sep=" ", file=output)
    print(file=output)

    # right
    for row in board:
        out = []
        for i in range(len(row)-1):
            out.append(f"right({row[i]},{row[i+1]}).")
        print(*out, sep=" ", file=output)

    # left
    print("left(A,B) :- right(B,A).", end="\n\n", file=output)

    # down
    for i in range(len(board)-1):
        out = []
        for j in range(len(board[i])):
            if len(board[i+1]) > j:
                out.append(f"down({board[i][j]},{board[i+1][j]}).")
        print(*out, sep=" ", file=output)

    # up
    print("up(A,B) :- down(B,A).", end="\n\n", file=output)

    # pieces
    for i, piece in enumerate(pieces):
        i += 1
        for ori in range(1,9):
            out = []
            for spaces in piece:
                spaces = spaces.split(",")
                spaces = list(map(orient(ori), spaces))
                lst = [f"{step}({ascii_uppercase[a]},{ascii_uppercase[a+1]})" for a, step in enumerate(spaces)]
                last_letter = ascii_uppercase[len(spaces)]
                out.append(f"cover({last_letter},{i}) :- origin({i},A,{ori}), {', '.join(lst)}.")
                for space in range(len(spaces)):
                    lst = [f"{step}({ascii_uppercase[a]},{ascii_uppercase[a+1]})" for a, step in enumerate(spaces[:space])]
                    lst.append(f"not {spaces[space]}({ascii_uppercase[space]},_)")
                    lst = f":- origin({i},A,{ori}), {', '.join(lst)}."
                    if lst not in out:
                        out.append(lst)
            print(*out, sep="\n", file=output)
        print(file=output)

    print(end="", file=output, flush=True)
    lp = output.getvalue()
    output.close()
    return lp

def wrap(arg: str):
    if arg.isdigit():
        return Number(int(arg))
    else:
        return Function(arg)  # no actual strings in the program so I'm using functions/0

def unwrap(arg: Symbol):
    if arg.type == SymbolType.Number:
        return arg.number
    elif arg.type == SymbolType.Function:
        return arg.name
    else:
        return arg.string

def halt(model):
    colors = {
        "1": f"{Fore.RED}{Back.CYAN} 1 {Style.RESET_ALL}",
        "2": f"{Fore.GREEN}{Back.MAGENTA} 2 {Style.RESET_ALL}",
        "3": f"{Fore.YELLOW}{Back.BLUE} 3 {Style.RESET_ALL}",
        "4": f"{Fore.BLUE}{Back.YELLOW} 4 {Style.RESET_ALL}",
        "5": f"{Fore.MAGENTA}{Back.GREEN} 5 {Style.RESET_ALL}",
        "6": f"{Fore.CYAN}{Back.RED} 6 {Style.RESET_ALL}",
        "7": f"{Fore.WHITE}{Back.BLACK} 7 {Style.RESET_ALL}",
        "8": f"{Fore.BLACK}{Back.WHITE} 8 {Style.RESET_ALL}",
    }
    symbols = {str(unwrap(s.arguments[0])): str(unwrap(s.arguments[1])) for s in model.symbols(shown=True)}
    out = []
    for line in board:
        line_out = []
        for space in line:
            symbol = symbols.get(space, "   ")
            symbol = colors.get(str(symbol), symbol)
            line_out.append(symbol)
        while len(line_out) < len(max(board, key=len)):
            line_out.append("   ")
        out.append("|".join(line_out))
    l = 27  # len(max(out, key=len))
    sep = "\n"+("-"*l)+"\n"
    s = sep.join(out)
    print(s)
    return False

def main(args):
    if args.today:
        today = date.today()
        month = calendar.month_abbr[today.month].lower()
        day = str(today.day)
    else:
        month = args.month if args.month is not None else input("Month (3 letter): ")
        month = month[:3].lower()
        day = args.day if args.day is not None else input("Day: ")
        day = day[:3].lower()
    lp = define_lp()
    if args.output is not None:
        with open(args.output, "w") as f:
            f.write(lp)
    ctl = Control(["0"])
    ctl.add("calendar", ["month", "day"], lp)
    ctl.ground([("calendar", [wrap(month), wrap(day)])])
    ctl.configuration.configuration = args.solver
    print("Running...")
    t = time.time()
    print(ctl.solve(on_model=halt, on_unsat=lambda _: print("UNSATISFIABLE")))
    if args.time:
        print(time.time() - t)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-m", "--month", default=None, help="Month to show.")
    parser.add_argument("-d", "--day", default=None, help="Day to show.")
    solvers = ["auto", "frumpy", "jumpy", "tweety", "handy", "crafty", "trendy", "many"]
    parser.add_argument("-s", "--solver", default="crafty", choices=solvers, help="The clingo solver strategy to use.")
    parser.add_argument("-o", "--output", default=None, help="File to output the logic program to.")
    parser.add_argument("-t", "--time", action="store_true", help="Display solve time after solving.")
    parser.add_argument("--today", action="store_true", help="Use today's date. Overrides -m and -d.")
    args = parser.parse_args()

    main(args)
