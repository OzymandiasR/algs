fun randRandom x y = Random.rand(x,y);

fun randRange lo hi = Random.randRange(lo,hi);

val randReal= Random.randReal;

fun randSamp n N seedLo seedHi = if n>N orelse n<1
				 then (print("The number of records you'd like selected can't be greater than the total number to choose from, or n needs to be positive! \n");[])
				 else
				     let
					 val myRand = randRandom seedLo seedHi
					 val fromInt = Real.fromInt
					 fun rSamp (a,b,c,D,E:int list) =
					   let
					       fun s2()= if fromInt(D-a)*(randReal myRand)>=fromInt(c-b)
							 then rSamp (a+1,b,c,D,E)
							 else
							     case b+1>c
							      of false => rSamp(a+1,b+1,c,D,(a+1)::E)
							       | _ => rev(E)
					   in
					       s2()
					   end
				     in
					 rSamp (0,0,n,N,[])
				     end;
