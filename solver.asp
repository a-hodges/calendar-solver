#program calendar(month, day).
#show cover/2.
piece(1..8). orientation(1..8).
:- right(A,B), right(A,C), B != C.
:- left(A,B), left(A,C), B != C.
:- up(A,B), up(A,C), B != C.
:- down(A,B), down(A,C), B != C.
{origin(A,B,C)} :- piece(A), space(B), orientation(C).
:- piece(A), not #count{B,C : origin(A,B,C)} = 1.
cover(B,A) :- origin(A,B,C).
:- uncovered(A), cover(A,B).
:- cover(A, B), cover(A, C), B != C.
uncovered(month). uncovered(day).

space(jan). space(feb). space(mar). space(apr). space(may). space(jun).
space(jul). space(aug). space(sep). space(oct). space(nov). space(dec).
space(1). space(2). space(3). space(4). space(5). space(6). space(7).
space(8). space(9). space(10). space(11). space(12). space(13). space(14).
space(15). space(16). space(17). space(18). space(19). space(20). space(21).
space(22). space(23). space(24). space(25). space(26). space(27). space(28).
space(29). space(30). space(31).

right(jan,feb). right(feb,mar). right(mar,apr). right(apr,may). right(may,jun).
right(jul,aug). right(aug,sep). right(sep,oct). right(oct,nov). right(nov,dec).
right(1,2). right(2,3). right(3,4). right(4,5). right(5,6). right(6,7).
right(8,9). right(9,10). right(10,11). right(11,12). right(12,13). right(13,14).
right(15,16). right(16,17). right(17,18). right(18,19). right(19,20). right(20,21).
right(22,23). right(23,24). right(24,25). right(25,26). right(26,27). right(27,28).
right(29,30). right(30,31).
left(A,B) :- right(B,A).

down(jan,jul). down(feb,aug). down(mar,sep). down(apr,oct). down(may,nov). down(jun,dec).
down(jul,1). down(aug,2). down(sep,3). down(oct,4). down(nov,5). down(dec,6).
down(1,8). down(2,9). down(3,10). down(4,11). down(5,12). down(6,13). down(7,14).
down(8,15). down(9,16). down(10,17). down(11,18). down(12,19). down(13,20). down(14,21).
down(15,22). down(16,23). down(17,24). down(18,25). down(19,26). down(20,27). down(21,28).
down(22,29). down(23,30). down(24,31).
up(A,B) :- down(B,A).

cover(B,1) :- origin(1,A,1), down(A,B).
:- origin(1,A,1), not down(A,_).
cover(B,1) :- origin(1,A,1), right(A,B).
:- origin(1,A,1), not right(A,_).
cover(C,1) :- origin(1,A,1), right(A,B), down(B,C).
:- origin(1,A,1), right(A,B), not down(B,_).
cover(C,1) :- origin(1,A,1), right(A,B), right(B,C).
:- origin(1,A,1), right(A,B), not right(B,_).
cover(D,1) :- origin(1,A,1), right(A,B), right(B,C), down(C,D).
:- origin(1,A,1), right(A,B), right(B,C), not down(C,_).
cover(B,1) :- origin(1,A,2), right(A,B).
:- origin(1,A,2), not right(A,_).
cover(B,1) :- origin(1,A,2), up(A,B).
:- origin(1,A,2), not up(A,_).
cover(C,1) :- origin(1,A,2), up(A,B), right(B,C).
:- origin(1,A,2), up(A,B), not right(B,_).
cover(C,1) :- origin(1,A,2), up(A,B), up(B,C).
:- origin(1,A,2), up(A,B), not up(B,_).
cover(D,1) :- origin(1,A,2), up(A,B), up(B,C), right(C,D).
:- origin(1,A,2), up(A,B), up(B,C), not right(C,_).
cover(B,1) :- origin(1,A,3), up(A,B).
:- origin(1,A,3), not up(A,_).
cover(B,1) :- origin(1,A,3), left(A,B).
:- origin(1,A,3), not left(A,_).
cover(C,1) :- origin(1,A,3), left(A,B), up(B,C).
:- origin(1,A,3), left(A,B), not up(B,_).
cover(C,1) :- origin(1,A,3), left(A,B), left(B,C).
:- origin(1,A,3), left(A,B), not left(B,_).
cover(D,1) :- origin(1,A,3), left(A,B), left(B,C), up(C,D).
:- origin(1,A,3), left(A,B), left(B,C), not up(C,_).
cover(B,1) :- origin(1,A,4), left(A,B).
:- origin(1,A,4), not left(A,_).
cover(B,1) :- origin(1,A,4), down(A,B).
:- origin(1,A,4), not down(A,_).
cover(C,1) :- origin(1,A,4), down(A,B), left(B,C).
:- origin(1,A,4), down(A,B), not left(B,_).
cover(C,1) :- origin(1,A,4), down(A,B), down(B,C).
:- origin(1,A,4), down(A,B), not down(B,_).
cover(D,1) :- origin(1,A,4), down(A,B), down(B,C), left(C,D).
:- origin(1,A,4), down(A,B), down(B,C), not left(C,_).
cover(B,1) :- origin(1,A,5), down(A,B).
:- origin(1,A,5), not down(A,_).
cover(B,1) :- origin(1,A,5), left(A,B).
:- origin(1,A,5), not left(A,_).
cover(C,1) :- origin(1,A,5), left(A,B), down(B,C).
:- origin(1,A,5), left(A,B), not down(B,_).
cover(C,1) :- origin(1,A,5), left(A,B), left(B,C).
:- origin(1,A,5), left(A,B), not left(B,_).
cover(D,1) :- origin(1,A,5), left(A,B), left(B,C), down(C,D).
:- origin(1,A,5), left(A,B), left(B,C), not down(C,_).
cover(B,1) :- origin(1,A,6), right(A,B).
:- origin(1,A,6), not right(A,_).
cover(B,1) :- origin(1,A,6), down(A,B).
:- origin(1,A,6), not down(A,_).
cover(C,1) :- origin(1,A,6), down(A,B), right(B,C).
:- origin(1,A,6), down(A,B), not right(B,_).
cover(C,1) :- origin(1,A,6), down(A,B), down(B,C).
:- origin(1,A,6), down(A,B), not down(B,_).
cover(D,1) :- origin(1,A,6), down(A,B), down(B,C), right(C,D).
:- origin(1,A,6), down(A,B), down(B,C), not right(C,_).
cover(B,1) :- origin(1,A,7), up(A,B).
:- origin(1,A,7), not up(A,_).
cover(B,1) :- origin(1,A,7), right(A,B).
:- origin(1,A,7), not right(A,_).
cover(C,1) :- origin(1,A,7), right(A,B), up(B,C).
:- origin(1,A,7), right(A,B), not up(B,_).
cover(C,1) :- origin(1,A,7), right(A,B), right(B,C).
:- origin(1,A,7), right(A,B), not right(B,_).
cover(D,1) :- origin(1,A,7), right(A,B), right(B,C), up(C,D).
:- origin(1,A,7), right(A,B), right(B,C), not up(C,_).
cover(B,1) :- origin(1,A,8), left(A,B).
:- origin(1,A,8), not left(A,_).
cover(B,1) :- origin(1,A,8), up(A,B).
:- origin(1,A,8), not up(A,_).
cover(C,1) :- origin(1,A,8), up(A,B), left(B,C).
:- origin(1,A,8), up(A,B), not left(B,_).
cover(C,1) :- origin(1,A,8), up(A,B), up(B,C).
:- origin(1,A,8), up(A,B), not up(B,_).
cover(D,1) :- origin(1,A,8), up(A,B), up(B,C), left(C,D).
:- origin(1,A,8), up(A,B), up(B,C), not left(C,_).

cover(B,2) :- origin(2,A,1), down(A,B).
:- origin(2,A,1), not down(A,_).
cover(B,2) :- origin(2,A,1), right(A,B).
:- origin(2,A,1), not right(A,_).
cover(C,2) :- origin(2,A,1), right(A,B), down(B,C).
:- origin(2,A,1), right(A,B), not down(B,_).
cover(C,2) :- origin(2,A,1), right(A,B), right(B,C).
:- origin(2,A,1), right(A,B), not right(B,_).
cover(B,2) :- origin(2,A,2), right(A,B).
:- origin(2,A,2), not right(A,_).
cover(B,2) :- origin(2,A,2), up(A,B).
:- origin(2,A,2), not up(A,_).
cover(C,2) :- origin(2,A,2), up(A,B), right(B,C).
:- origin(2,A,2), up(A,B), not right(B,_).
cover(C,2) :- origin(2,A,2), up(A,B), up(B,C).
:- origin(2,A,2), up(A,B), not up(B,_).
cover(B,2) :- origin(2,A,3), up(A,B).
:- origin(2,A,3), not up(A,_).
cover(B,2) :- origin(2,A,3), left(A,B).
:- origin(2,A,3), not left(A,_).
cover(C,2) :- origin(2,A,3), left(A,B), up(B,C).
:- origin(2,A,3), left(A,B), not up(B,_).
cover(C,2) :- origin(2,A,3), left(A,B), left(B,C).
:- origin(2,A,3), left(A,B), not left(B,_).
cover(B,2) :- origin(2,A,4), left(A,B).
:- origin(2,A,4), not left(A,_).
cover(B,2) :- origin(2,A,4), down(A,B).
:- origin(2,A,4), not down(A,_).
cover(C,2) :- origin(2,A,4), down(A,B), left(B,C).
:- origin(2,A,4), down(A,B), not left(B,_).
cover(C,2) :- origin(2,A,4), down(A,B), down(B,C).
:- origin(2,A,4), down(A,B), not down(B,_).
cover(B,2) :- origin(2,A,5), down(A,B).
:- origin(2,A,5), not down(A,_).
cover(B,2) :- origin(2,A,5), left(A,B).
:- origin(2,A,5), not left(A,_).
cover(C,2) :- origin(2,A,5), left(A,B), down(B,C).
:- origin(2,A,5), left(A,B), not down(B,_).
cover(C,2) :- origin(2,A,5), left(A,B), left(B,C).
:- origin(2,A,5), left(A,B), not left(B,_).
cover(B,2) :- origin(2,A,6), right(A,B).
:- origin(2,A,6), not right(A,_).
cover(B,2) :- origin(2,A,6), down(A,B).
:- origin(2,A,6), not down(A,_).
cover(C,2) :- origin(2,A,6), down(A,B), right(B,C).
:- origin(2,A,6), down(A,B), not right(B,_).
cover(C,2) :- origin(2,A,6), down(A,B), down(B,C).
:- origin(2,A,6), down(A,B), not down(B,_).
cover(B,2) :- origin(2,A,7), up(A,B).
:- origin(2,A,7), not up(A,_).
cover(B,2) :- origin(2,A,7), right(A,B).
:- origin(2,A,7), not right(A,_).
cover(C,2) :- origin(2,A,7), right(A,B), up(B,C).
:- origin(2,A,7), right(A,B), not up(B,_).
cover(C,2) :- origin(2,A,7), right(A,B), right(B,C).
:- origin(2,A,7), right(A,B), not right(B,_).
cover(B,2) :- origin(2,A,8), left(A,B).
:- origin(2,A,8), not left(A,_).
cover(B,2) :- origin(2,A,8), up(A,B).
:- origin(2,A,8), not up(A,_).
cover(C,2) :- origin(2,A,8), up(A,B), left(B,C).
:- origin(2,A,8), up(A,B), not left(B,_).
cover(C,2) :- origin(2,A,8), up(A,B), up(B,C).
:- origin(2,A,8), up(A,B), not up(B,_).

cover(B,3) :- origin(3,A,1), down(A,B).
:- origin(3,A,1), not down(A,_).
cover(B,3) :- origin(3,A,1), right(A,B).
:- origin(3,A,1), not right(A,_).
cover(C,3) :- origin(3,A,1), right(A,B), right(B,C).
:- origin(3,A,1), right(A,B), not right(B,_).
cover(D,3) :- origin(3,A,1), right(A,B), right(B,C), down(C,D).
:- origin(3,A,1), right(A,B), right(B,C), not down(C,_).
cover(B,3) :- origin(3,A,2), right(A,B).
:- origin(3,A,2), not right(A,_).
cover(B,3) :- origin(3,A,2), up(A,B).
:- origin(3,A,2), not up(A,_).
cover(C,3) :- origin(3,A,2), up(A,B), up(B,C).
:- origin(3,A,2), up(A,B), not up(B,_).
cover(D,3) :- origin(3,A,2), up(A,B), up(B,C), right(C,D).
:- origin(3,A,2), up(A,B), up(B,C), not right(C,_).
cover(B,3) :- origin(3,A,3), up(A,B).
:- origin(3,A,3), not up(A,_).
cover(B,3) :- origin(3,A,3), left(A,B).
:- origin(3,A,3), not left(A,_).
cover(C,3) :- origin(3,A,3), left(A,B), left(B,C).
:- origin(3,A,3), left(A,B), not left(B,_).
cover(D,3) :- origin(3,A,3), left(A,B), left(B,C), up(C,D).
:- origin(3,A,3), left(A,B), left(B,C), not up(C,_).
cover(B,3) :- origin(3,A,4), left(A,B).
:- origin(3,A,4), not left(A,_).
cover(B,3) :- origin(3,A,4), down(A,B).
:- origin(3,A,4), not down(A,_).
cover(C,3) :- origin(3,A,4), down(A,B), down(B,C).
:- origin(3,A,4), down(A,B), not down(B,_).
cover(D,3) :- origin(3,A,4), down(A,B), down(B,C), left(C,D).
:- origin(3,A,4), down(A,B), down(B,C), not left(C,_).
cover(B,3) :- origin(3,A,5), down(A,B).
:- origin(3,A,5), not down(A,_).
cover(B,3) :- origin(3,A,5), left(A,B).
:- origin(3,A,5), not left(A,_).
cover(C,3) :- origin(3,A,5), left(A,B), left(B,C).
:- origin(3,A,5), left(A,B), not left(B,_).
cover(D,3) :- origin(3,A,5), left(A,B), left(B,C), down(C,D).
:- origin(3,A,5), left(A,B), left(B,C), not down(C,_).
cover(B,3) :- origin(3,A,6), right(A,B).
:- origin(3,A,6), not right(A,_).
cover(B,3) :- origin(3,A,6), down(A,B).
:- origin(3,A,6), not down(A,_).
cover(C,3) :- origin(3,A,6), down(A,B), down(B,C).
:- origin(3,A,6), down(A,B), not down(B,_).
cover(D,3) :- origin(3,A,6), down(A,B), down(B,C), right(C,D).
:- origin(3,A,6), down(A,B), down(B,C), not right(C,_).
cover(B,3) :- origin(3,A,7), up(A,B).
:- origin(3,A,7), not up(A,_).
cover(B,3) :- origin(3,A,7), right(A,B).
:- origin(3,A,7), not right(A,_).
cover(C,3) :- origin(3,A,7), right(A,B), right(B,C).
:- origin(3,A,7), right(A,B), not right(B,_).
cover(D,3) :- origin(3,A,7), right(A,B), right(B,C), up(C,D).
:- origin(3,A,7), right(A,B), right(B,C), not up(C,_).
cover(B,3) :- origin(3,A,8), left(A,B).
:- origin(3,A,8), not left(A,_).
cover(B,3) :- origin(3,A,8), up(A,B).
:- origin(3,A,8), not up(A,_).
cover(C,3) :- origin(3,A,8), up(A,B), up(B,C).
:- origin(3,A,8), up(A,B), not up(B,_).
cover(D,3) :- origin(3,A,8), up(A,B), up(B,C), left(C,D).
:- origin(3,A,8), up(A,B), up(B,C), not left(C,_).

cover(B,4) :- origin(4,A,1), right(A,B).
:- origin(4,A,1), not right(A,_).
cover(C,4) :- origin(4,A,1), right(A,B), right(B,C).
:- origin(4,A,1), right(A,B), not right(B,_).
cover(D,4) :- origin(4,A,1), right(A,B), right(B,C), right(C,D).
:- origin(4,A,1), right(A,B), right(B,C), not right(C,_).
cover(B,4) :- origin(4,A,1), down(A,B).
:- origin(4,A,1), not down(A,_).
cover(B,4) :- origin(4,A,2), up(A,B).
:- origin(4,A,2), not up(A,_).
cover(C,4) :- origin(4,A,2), up(A,B), up(B,C).
:- origin(4,A,2), up(A,B), not up(B,_).
cover(D,4) :- origin(4,A,2), up(A,B), up(B,C), up(C,D).
:- origin(4,A,2), up(A,B), up(B,C), not up(C,_).
cover(B,4) :- origin(4,A,2), right(A,B).
:- origin(4,A,2), not right(A,_).
cover(B,4) :- origin(4,A,3), left(A,B).
:- origin(4,A,3), not left(A,_).
cover(C,4) :- origin(4,A,3), left(A,B), left(B,C).
:- origin(4,A,3), left(A,B), not left(B,_).
cover(D,4) :- origin(4,A,3), left(A,B), left(B,C), left(C,D).
:- origin(4,A,3), left(A,B), left(B,C), not left(C,_).
cover(B,4) :- origin(4,A,3), up(A,B).
:- origin(4,A,3), not up(A,_).
cover(B,4) :- origin(4,A,4), down(A,B).
:- origin(4,A,4), not down(A,_).
cover(C,4) :- origin(4,A,4), down(A,B), down(B,C).
:- origin(4,A,4), down(A,B), not down(B,_).
cover(D,4) :- origin(4,A,4), down(A,B), down(B,C), down(C,D).
:- origin(4,A,4), down(A,B), down(B,C), not down(C,_).
cover(B,4) :- origin(4,A,4), left(A,B).
:- origin(4,A,4), not left(A,_).
cover(B,4) :- origin(4,A,5), left(A,B).
:- origin(4,A,5), not left(A,_).
cover(C,4) :- origin(4,A,5), left(A,B), left(B,C).
:- origin(4,A,5), left(A,B), not left(B,_).
cover(D,4) :- origin(4,A,5), left(A,B), left(B,C), left(C,D).
:- origin(4,A,5), left(A,B), left(B,C), not left(C,_).
cover(B,4) :- origin(4,A,5), down(A,B).
:- origin(4,A,5), not down(A,_).
cover(B,4) :- origin(4,A,6), down(A,B).
:- origin(4,A,6), not down(A,_).
cover(C,4) :- origin(4,A,6), down(A,B), down(B,C).
:- origin(4,A,6), down(A,B), not down(B,_).
cover(D,4) :- origin(4,A,6), down(A,B), down(B,C), down(C,D).
:- origin(4,A,6), down(A,B), down(B,C), not down(C,_).
cover(B,4) :- origin(4,A,6), right(A,B).
:- origin(4,A,6), not right(A,_).
cover(B,4) :- origin(4,A,7), right(A,B).
:- origin(4,A,7), not right(A,_).
cover(C,4) :- origin(4,A,7), right(A,B), right(B,C).
:- origin(4,A,7), right(A,B), not right(B,_).
cover(D,4) :- origin(4,A,7), right(A,B), right(B,C), right(C,D).
:- origin(4,A,7), right(A,B), right(B,C), not right(C,_).
cover(B,4) :- origin(4,A,7), up(A,B).
:- origin(4,A,7), not up(A,_).
cover(B,4) :- origin(4,A,8), up(A,B).
:- origin(4,A,8), not up(A,_).
cover(C,4) :- origin(4,A,8), up(A,B), up(B,C).
:- origin(4,A,8), up(A,B), not up(B,_).
cover(D,4) :- origin(4,A,8), up(A,B), up(B,C), up(C,D).
:- origin(4,A,8), up(A,B), up(B,C), not up(C,_).
cover(B,4) :- origin(4,A,8), left(A,B).
:- origin(4,A,8), not left(A,_).

cover(B,5) :- origin(5,A,1), right(A,B).
:- origin(5,A,1), not right(A,_).
cover(C,5) :- origin(5,A,1), right(A,B), right(B,C).
:- origin(5,A,1), right(A,B), not right(B,_).
cover(D,5) :- origin(5,A,1), right(A,B), right(B,C), right(C,D).
:- origin(5,A,1), right(A,B), right(B,C), not right(C,_).
cover(C,5) :- origin(5,A,1), right(A,B), down(B,C).
:- origin(5,A,1), right(A,B), not down(B,_).
cover(B,5) :- origin(5,A,2), up(A,B).
:- origin(5,A,2), not up(A,_).
cover(C,5) :- origin(5,A,2), up(A,B), up(B,C).
:- origin(5,A,2), up(A,B), not up(B,_).
cover(D,5) :- origin(5,A,2), up(A,B), up(B,C), up(C,D).
:- origin(5,A,2), up(A,B), up(B,C), not up(C,_).
cover(C,5) :- origin(5,A,2), up(A,B), right(B,C).
:- origin(5,A,2), up(A,B), not right(B,_).
cover(B,5) :- origin(5,A,3), left(A,B).
:- origin(5,A,3), not left(A,_).
cover(C,5) :- origin(5,A,3), left(A,B), left(B,C).
:- origin(5,A,3), left(A,B), not left(B,_).
cover(D,5) :- origin(5,A,3), left(A,B), left(B,C), left(C,D).
:- origin(5,A,3), left(A,B), left(B,C), not left(C,_).
cover(C,5) :- origin(5,A,3), left(A,B), up(B,C).
:- origin(5,A,3), left(A,B), not up(B,_).
cover(B,5) :- origin(5,A,4), down(A,B).
:- origin(5,A,4), not down(A,_).
cover(C,5) :- origin(5,A,4), down(A,B), down(B,C).
:- origin(5,A,4), down(A,B), not down(B,_).
cover(D,5) :- origin(5,A,4), down(A,B), down(B,C), down(C,D).
:- origin(5,A,4), down(A,B), down(B,C), not down(C,_).
cover(C,5) :- origin(5,A,4), down(A,B), left(B,C).
:- origin(5,A,4), down(A,B), not left(B,_).
cover(B,5) :- origin(5,A,5), left(A,B).
:- origin(5,A,5), not left(A,_).
cover(C,5) :- origin(5,A,5), left(A,B), left(B,C).
:- origin(5,A,5), left(A,B), not left(B,_).
cover(D,5) :- origin(5,A,5), left(A,B), left(B,C), left(C,D).
:- origin(5,A,5), left(A,B), left(B,C), not left(C,_).
cover(C,5) :- origin(5,A,5), left(A,B), down(B,C).
:- origin(5,A,5), left(A,B), not down(B,_).
cover(B,5) :- origin(5,A,6), down(A,B).
:- origin(5,A,6), not down(A,_).
cover(C,5) :- origin(5,A,6), down(A,B), down(B,C).
:- origin(5,A,6), down(A,B), not down(B,_).
cover(D,5) :- origin(5,A,6), down(A,B), down(B,C), down(C,D).
:- origin(5,A,6), down(A,B), down(B,C), not down(C,_).
cover(C,5) :- origin(5,A,6), down(A,B), right(B,C).
:- origin(5,A,6), down(A,B), not right(B,_).
cover(B,5) :- origin(5,A,7), right(A,B).
:- origin(5,A,7), not right(A,_).
cover(C,5) :- origin(5,A,7), right(A,B), right(B,C).
:- origin(5,A,7), right(A,B), not right(B,_).
cover(D,5) :- origin(5,A,7), right(A,B), right(B,C), right(C,D).
:- origin(5,A,7), right(A,B), right(B,C), not right(C,_).
cover(C,5) :- origin(5,A,7), right(A,B), up(B,C).
:- origin(5,A,7), right(A,B), not up(B,_).
cover(B,5) :- origin(5,A,8), up(A,B).
:- origin(5,A,8), not up(A,_).
cover(C,5) :- origin(5,A,8), up(A,B), up(B,C).
:- origin(5,A,8), up(A,B), not up(B,_).
cover(D,5) :- origin(5,A,8), up(A,B), up(B,C), up(C,D).
:- origin(5,A,8), up(A,B), up(B,C), not up(C,_).
cover(C,5) :- origin(5,A,8), up(A,B), left(B,C).
:- origin(5,A,8), up(A,B), not left(B,_).

cover(B,6) :- origin(6,A,1), right(A,B).
:- origin(6,A,1), not right(A,_).
cover(C,6) :- origin(6,A,1), right(A,B), right(B,C).
:- origin(6,A,1), right(A,B), not right(B,_).
cover(B,6) :- origin(6,A,1), down(A,B).
:- origin(6,A,1), not down(A,_).
cover(C,6) :- origin(6,A,1), down(A,B), down(B,C).
:- origin(6,A,1), down(A,B), not down(B,_).
cover(B,6) :- origin(6,A,2), up(A,B).
:- origin(6,A,2), not up(A,_).
cover(C,6) :- origin(6,A,2), up(A,B), up(B,C).
:- origin(6,A,2), up(A,B), not up(B,_).
cover(B,6) :- origin(6,A,2), right(A,B).
:- origin(6,A,2), not right(A,_).
cover(C,6) :- origin(6,A,2), right(A,B), right(B,C).
:- origin(6,A,2), right(A,B), not right(B,_).
cover(B,6) :- origin(6,A,3), left(A,B).
:- origin(6,A,3), not left(A,_).
cover(C,6) :- origin(6,A,3), left(A,B), left(B,C).
:- origin(6,A,3), left(A,B), not left(B,_).
cover(B,6) :- origin(6,A,3), up(A,B).
:- origin(6,A,3), not up(A,_).
cover(C,6) :- origin(6,A,3), up(A,B), up(B,C).
:- origin(6,A,3), up(A,B), not up(B,_).
cover(B,6) :- origin(6,A,4), down(A,B).
:- origin(6,A,4), not down(A,_).
cover(C,6) :- origin(6,A,4), down(A,B), down(B,C).
:- origin(6,A,4), down(A,B), not down(B,_).
cover(B,6) :- origin(6,A,4), left(A,B).
:- origin(6,A,4), not left(A,_).
cover(C,6) :- origin(6,A,4), left(A,B), left(B,C).
:- origin(6,A,4), left(A,B), not left(B,_).
cover(B,6) :- origin(6,A,5), left(A,B).
:- origin(6,A,5), not left(A,_).
cover(C,6) :- origin(6,A,5), left(A,B), left(B,C).
:- origin(6,A,5), left(A,B), not left(B,_).
cover(B,6) :- origin(6,A,5), down(A,B).
:- origin(6,A,5), not down(A,_).
cover(C,6) :- origin(6,A,5), down(A,B), down(B,C).
:- origin(6,A,5), down(A,B), not down(B,_).
cover(B,6) :- origin(6,A,6), down(A,B).
:- origin(6,A,6), not down(A,_).
cover(C,6) :- origin(6,A,6), down(A,B), down(B,C).
:- origin(6,A,6), down(A,B), not down(B,_).
cover(B,6) :- origin(6,A,6), right(A,B).
:- origin(6,A,6), not right(A,_).
cover(C,6) :- origin(6,A,6), right(A,B), right(B,C).
:- origin(6,A,6), right(A,B), not right(B,_).
cover(B,6) :- origin(6,A,7), right(A,B).
:- origin(6,A,7), not right(A,_).
cover(C,6) :- origin(6,A,7), right(A,B), right(B,C).
:- origin(6,A,7), right(A,B), not right(B,_).
cover(B,6) :- origin(6,A,7), up(A,B).
:- origin(6,A,7), not up(A,_).
cover(C,6) :- origin(6,A,7), up(A,B), up(B,C).
:- origin(6,A,7), up(A,B), not up(B,_).
cover(B,6) :- origin(6,A,8), up(A,B).
:- origin(6,A,8), not up(A,_).
cover(C,6) :- origin(6,A,8), up(A,B), up(B,C).
:- origin(6,A,8), up(A,B), not up(B,_).
cover(B,6) :- origin(6,A,8), left(A,B).
:- origin(6,A,8), not left(A,_).
cover(C,6) :- origin(6,A,8), left(A,B), left(B,C).
:- origin(6,A,8), left(A,B), not left(B,_).

cover(B,7) :- origin(7,A,1), right(A,B).
:- origin(7,A,1), not right(A,_).
cover(C,7) :- origin(7,A,1), right(A,B), right(B,C).
:- origin(7,A,1), right(A,B), not right(B,_).
cover(D,7) :- origin(7,A,1), right(A,B), right(B,C), down(C,D).
:- origin(7,A,1), right(A,B), right(B,C), not down(C,_).
cover(E,7) :- origin(7,A,1), right(A,B), right(B,C), down(C,D), right(D,E).
:- origin(7,A,1), right(A,B), right(B,C), down(C,D), not right(D,_).
cover(B,7) :- origin(7,A,2), up(A,B).
:- origin(7,A,2), not up(A,_).
cover(C,7) :- origin(7,A,2), up(A,B), up(B,C).
:- origin(7,A,2), up(A,B), not up(B,_).
cover(D,7) :- origin(7,A,2), up(A,B), up(B,C), right(C,D).
:- origin(7,A,2), up(A,B), up(B,C), not right(C,_).
cover(E,7) :- origin(7,A,2), up(A,B), up(B,C), right(C,D), up(D,E).
:- origin(7,A,2), up(A,B), up(B,C), right(C,D), not up(D,_).
cover(B,7) :- origin(7,A,3), left(A,B).
:- origin(7,A,3), not left(A,_).
cover(C,7) :- origin(7,A,3), left(A,B), left(B,C).
:- origin(7,A,3), left(A,B), not left(B,_).
cover(D,7) :- origin(7,A,3), left(A,B), left(B,C), up(C,D).
:- origin(7,A,3), left(A,B), left(B,C), not up(C,_).
cover(E,7) :- origin(7,A,3), left(A,B), left(B,C), up(C,D), left(D,E).
:- origin(7,A,3), left(A,B), left(B,C), up(C,D), not left(D,_).
cover(B,7) :- origin(7,A,4), down(A,B).
:- origin(7,A,4), not down(A,_).
cover(C,7) :- origin(7,A,4), down(A,B), down(B,C).
:- origin(7,A,4), down(A,B), not down(B,_).
cover(D,7) :- origin(7,A,4), down(A,B), down(B,C), left(C,D).
:- origin(7,A,4), down(A,B), down(B,C), not left(C,_).
cover(E,7) :- origin(7,A,4), down(A,B), down(B,C), left(C,D), down(D,E).
:- origin(7,A,4), down(A,B), down(B,C), left(C,D), not down(D,_).
cover(B,7) :- origin(7,A,5), left(A,B).
:- origin(7,A,5), not left(A,_).
cover(C,7) :- origin(7,A,5), left(A,B), left(B,C).
:- origin(7,A,5), left(A,B), not left(B,_).
cover(D,7) :- origin(7,A,5), left(A,B), left(B,C), down(C,D).
:- origin(7,A,5), left(A,B), left(B,C), not down(C,_).
cover(E,7) :- origin(7,A,5), left(A,B), left(B,C), down(C,D), left(D,E).
:- origin(7,A,5), left(A,B), left(B,C), down(C,D), not left(D,_).
cover(B,7) :- origin(7,A,6), down(A,B).
:- origin(7,A,6), not down(A,_).
cover(C,7) :- origin(7,A,6), down(A,B), down(B,C).
:- origin(7,A,6), down(A,B), not down(B,_).
cover(D,7) :- origin(7,A,6), down(A,B), down(B,C), right(C,D).
:- origin(7,A,6), down(A,B), down(B,C), not right(C,_).
cover(E,7) :- origin(7,A,6), down(A,B), down(B,C), right(C,D), down(D,E).
:- origin(7,A,6), down(A,B), down(B,C), right(C,D), not down(D,_).
cover(B,7) :- origin(7,A,7), right(A,B).
:- origin(7,A,7), not right(A,_).
cover(C,7) :- origin(7,A,7), right(A,B), right(B,C).
:- origin(7,A,7), right(A,B), not right(B,_).
cover(D,7) :- origin(7,A,7), right(A,B), right(B,C), up(C,D).
:- origin(7,A,7), right(A,B), right(B,C), not up(C,_).
cover(E,7) :- origin(7,A,7), right(A,B), right(B,C), up(C,D), right(D,E).
:- origin(7,A,7), right(A,B), right(B,C), up(C,D), not right(D,_).
cover(B,7) :- origin(7,A,8), up(A,B).
:- origin(7,A,8), not up(A,_).
cover(C,7) :- origin(7,A,8), up(A,B), up(B,C).
:- origin(7,A,8), up(A,B), not up(B,_).
cover(D,7) :- origin(7,A,8), up(A,B), up(B,C), left(C,D).
:- origin(7,A,8), up(A,B), up(B,C), not left(C,_).
cover(E,7) :- origin(7,A,8), up(A,B), up(B,C), left(C,D), up(D,E).
:- origin(7,A,8), up(A,B), up(B,C), left(C,D), not up(D,_).

cover(B,8) :- origin(8,A,1), right(A,B).
:- origin(8,A,1), not right(A,_).
cover(C,8) :- origin(8,A,1), right(A,B), down(B,C).
:- origin(8,A,1), right(A,B), not down(B,_).
cover(D,8) :- origin(8,A,1), right(A,B), down(B,C), down(C,D).
:- origin(8,A,1), right(A,B), down(B,C), not down(C,_).
cover(E,8) :- origin(8,A,1), right(A,B), down(B,C), down(C,D), right(D,E).
:- origin(8,A,1), right(A,B), down(B,C), down(C,D), not right(D,_).
cover(B,8) :- origin(8,A,2), up(A,B).
:- origin(8,A,2), not up(A,_).
cover(C,8) :- origin(8,A,2), up(A,B), right(B,C).
:- origin(8,A,2), up(A,B), not right(B,_).
cover(D,8) :- origin(8,A,2), up(A,B), right(B,C), right(C,D).
:- origin(8,A,2), up(A,B), right(B,C), not right(C,_).
cover(E,8) :- origin(8,A,2), up(A,B), right(B,C), right(C,D), up(D,E).
:- origin(8,A,2), up(A,B), right(B,C), right(C,D), not up(D,_).
cover(B,8) :- origin(8,A,3), left(A,B).
:- origin(8,A,3), not left(A,_).
cover(C,8) :- origin(8,A,3), left(A,B), up(B,C).
:- origin(8,A,3), left(A,B), not up(B,_).
cover(D,8) :- origin(8,A,3), left(A,B), up(B,C), up(C,D).
:- origin(8,A,3), left(A,B), up(B,C), not up(C,_).
cover(E,8) :- origin(8,A,3), left(A,B), up(B,C), up(C,D), left(D,E).
:- origin(8,A,3), left(A,B), up(B,C), up(C,D), not left(D,_).
cover(B,8) :- origin(8,A,4), down(A,B).
:- origin(8,A,4), not down(A,_).
cover(C,8) :- origin(8,A,4), down(A,B), left(B,C).
:- origin(8,A,4), down(A,B), not left(B,_).
cover(D,8) :- origin(8,A,4), down(A,B), left(B,C), left(C,D).
:- origin(8,A,4), down(A,B), left(B,C), not left(C,_).
cover(E,8) :- origin(8,A,4), down(A,B), left(B,C), left(C,D), down(D,E).
:- origin(8,A,4), down(A,B), left(B,C), left(C,D), not down(D,_).
cover(B,8) :- origin(8,A,5), left(A,B).
:- origin(8,A,5), not left(A,_).
cover(C,8) :- origin(8,A,5), left(A,B), down(B,C).
:- origin(8,A,5), left(A,B), not down(B,_).
cover(D,8) :- origin(8,A,5), left(A,B), down(B,C), down(C,D).
:- origin(8,A,5), left(A,B), down(B,C), not down(C,_).
cover(E,8) :- origin(8,A,5), left(A,B), down(B,C), down(C,D), left(D,E).
:- origin(8,A,5), left(A,B), down(B,C), down(C,D), not left(D,_).
cover(B,8) :- origin(8,A,6), down(A,B).
:- origin(8,A,6), not down(A,_).
cover(C,8) :- origin(8,A,6), down(A,B), right(B,C).
:- origin(8,A,6), down(A,B), not right(B,_).
cover(D,8) :- origin(8,A,6), down(A,B), right(B,C), right(C,D).
:- origin(8,A,6), down(A,B), right(B,C), not right(C,_).
cover(E,8) :- origin(8,A,6), down(A,B), right(B,C), right(C,D), down(D,E).
:- origin(8,A,6), down(A,B), right(B,C), right(C,D), not down(D,_).
cover(B,8) :- origin(8,A,7), right(A,B).
:- origin(8,A,7), not right(A,_).
cover(C,8) :- origin(8,A,7), right(A,B), up(B,C).
:- origin(8,A,7), right(A,B), not up(B,_).
cover(D,8) :- origin(8,A,7), right(A,B), up(B,C), up(C,D).
:- origin(8,A,7), right(A,B), up(B,C), not up(C,_).
cover(E,8) :- origin(8,A,7), right(A,B), up(B,C), up(C,D), right(D,E).
:- origin(8,A,7), right(A,B), up(B,C), up(C,D), not right(D,_).
cover(B,8) :- origin(8,A,8), up(A,B).
:- origin(8,A,8), not up(A,_).
cover(C,8) :- origin(8,A,8), up(A,B), left(B,C).
:- origin(8,A,8), up(A,B), not left(B,_).
cover(D,8) :- origin(8,A,8), up(A,B), left(B,C), left(C,D).
:- origin(8,A,8), up(A,B), left(B,C), not left(C,_).
cover(E,8) :- origin(8,A,8), up(A,B), left(B,C), left(C,D), up(D,E).
:- origin(8,A,8), up(A,B), left(B,C), left(C,D), not up(D,_).

