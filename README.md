# processingOctober2021
a place to cold some processing sketches I made while in the office

## ravenWordsp uses the ttslib https://www.local-guru.net/blog/pages/ttslib

ravenWordsp does not work in processing 4, because of the library, but i will work with processing 3

## ravenWord dosen't have tts

## sol LeWitt and wall draw

>“On a wall surface, any
 continuous stretch of wall,
 using a hard pencil, place
 fifty points at random.
 The points should be evenly
 distributed over the area
 of the wall. All of the
 points should be connected
 by straight lines. “ -Wall drawing 118
 
 >A complete graph also called a Full Graph
 it is a graph that has n vertices where
 the degree of each vertex is n-1.
 In other words, each vertex is connected with
 every other vertex.
 
 https://mathworld.wolfram.com/CompleteGraph.html
 
 >Now, you have n vertices in total,
 so you might be tempted to say that there are
 n(n−1) edges in total, n−1 for every vertex in
 your graph. But this method counts every edge twice,
 because every edge going out from one
 vertex is an edge going into another vertex.
 Hence, you have to divide your result by 2.
 This leaves you with n(n−1)/2.
 
 
 ## polarDrift 
 
 is a modular mult. line art with simple polar coordinates.
 You can click around to get differnt multiples and points on the circle
 if theta gets high it starts to get out of phase and drift
 see some images at my instagram
 
 ## Digital Harmony sketches are playing with sine waves to look like Whitney's digital harmony
 the waves are drawn with no loops, one loop and two loops and either scroll or not
 
 
 ## sandpiles
 
 https://www.instagram.com/p/CY4IIRYoNmR/
 
 https://www.instagram.com/p/CY6aNSPIo05/
 
Sandpile with numbers of grains of sand in each cell. There is a 2d array that keeps track of the number of grains at the cells x y position. The max number of grains of sand in a cell is 3. The  ‘#’ indicates that the cell contains 4 or greater.  If a cell has four or greater it gives up one grain to each of its 4 neighbors (NSEW neighbors not all eight neighbors).  The next generation of the board is done like the game of life. A second array keeps track of the changes, so not to overwrite changes on the original. When all the cells are checked and all the overflows for one generation are updated the original array is set to the new array and the process repeats.  There is a great #numberphile video, #thecodingtrain code challenge  and most recently Jordan Ellenberg’s https://nautil.us/issue/107/the-edge/the-math-of-the-amazing-sandpile
 #creativecoding #processing #math #sandpile #p5js #math  

have done some more work on the sand piles not with simpler with one loop.  

have also made a version on a torus using modulo

the large amout dropped in the center will then continue forever with some interesting patterns

doubling time is seen.  I havent found a good setting for a chaotic mess but I am sure it is there

I have also made a version to place many grains of sand in all of the cells

bu this looks better when it is on a closed plane not a tours

I have uploaded all  of these versons.  I have not improved the earlier versions with one loop

but I will make a seperate repo for sand piles and make a p5 version to use on the web

## chaos carpet

here is a Sierpiński carpet made with points from a simple chaos game.  I originally coded this on my phone in the office. I had forgotten about it and was reminded when I saw this great video by Mr. Sparks 
The Chaos Game - Geogebra Build - as seen on Numberphile

https://youtu.be/IKhahq9EwPw

He is using geogebra but his explanation of the Hausdorff dimension is great in the third part of the video

the carpet is:

- 3 times bigger in length
- 8 copies
- so 3 to what power is 8
-  3**x = 8
- fd = log(8)/log(3)
- The Hausdorff dimension is log(8)/log(3) == 1.892

## Sierpinski Tetrahedron

https://www.instagram.com/p/CZcKHE8oJKi/

Pulling a two dimensional square into the third dimension as Sierpinski Tetrahedron, using the chaos game in processing P3D.  3D is fast, each frame I am plotting over 10,000 points half way to one of four original points. if it is only plotted in 2d this would create a solid square. but by putting one point into the third dimension it produces an object that has a Hausdorff dimension of 2 in 3d space. using PVector and built in lerp function. #math #creativecode #processing #p5js #chaos #fractal


## Menger sponge

https://www.instagram.com/p/CZejeDkoLN2/

Some more 3d chaos game.  This time the Menger sponge. The 20 points are put into an array as vectors.  One of the points is randomly picked. Then the plotting vector is calculated as 2/3 the way to that point using the PVector lerp() function. The color is mapped to the index of the points in HSB mode. creates a complex image with just a little bit of code.   #math #creativecode #processing #p5js #chaos #fractal #creativecoding 

so what is the Hausdorff dimension of the Menger sponge.  Let's look at how it is created by scaling. The length scales by 3.  

regular cube

- so let's look first at  scaling a regular cube by three 
- if we scale by three there will be 27 copies 
- so we can get the dimension d by  (scale factor: 3) raised to what (power d) = (copies: 27)
- 3^d = 27  
- d= 3 : 3^3 = 27
- the dimension is 3.  It is 3 dimensional. 

Menger Sponge

- The Menger Sponge is also scaled by 3
- but the Menger Sponge has only 20 copies (in the code they are the original 20 vectors, the other 7 are  its distinctive holes)
- so dimension is d  is (scale factor:3) raised to what (power d) = (copies: 20)
- 3^d =20
- we know d is less than 3, and greater than 2, 3^3=27, 3^2 = 9
- we can get the dimension using logs
- log(3^d) = log(20) 
- d*log(3) = log(20) (we can move the exponent out using the power rule of logs )
- d = log(20)/log(3) 
- d = 2.72683 
- this is a fractional dimensions (where the name fractal originates)




-------
## ulamCA

reading The Recursive Universe 1985 by William Poundstone and making a version of Ulum's coral reefs

as described in chapter 8 of the book

such a great book!!

These are the first attemts at the Ulam type CA and the rules are simple but depend but dynamically

take into acount generation.  so keeping flavor of the one originally described.
