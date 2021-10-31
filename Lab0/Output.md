# Lab 0

## Exercise 1

```matlab
>> a = [2 ; 4]

a =

     2
     4

>> b = [3 ; 1]

b =

     3
     1

>> a'

ans =

     2     4

>> b'

ans =

     3     1

>> a * b'

ans =

     6     2
    12     4

>> a' b
 a' b
    ↑
Error: Invalid expression. Check for missing multiplication operator, missing or
unbalanced delimiters, or other syntax error. To construct matrices, use brackets
instead of parentheses.
 
>> b' * a

ans =

    10

>> a' * b

ans =

    10

>> a .* b

ans =

     6
     4

>> 3 .* b

ans =

     9
     3

>> 
```
## Exercise 2

```
>> a * b
Error using  * 
Incorrect dimensions for matrix multiplication. Check that the number of columns in
the first matrix matches the number of rows in the second matrix. To perform
elementwise multiplication, use '.*'.
```

## Exercise 3

```
>> c = a + b

c =

     5
     5

>> d = a + b;
>> d

d =

     5
     5

>> 
```

## Exercise 4

```
>> e = 17

e =

    17

>> size(a)

ans =

     2     1

>> size(b')

ans =

     1     2

>> size(e)

ans =

     1     1

>> length(a')

ans =

     2

>> length(b)

ans =

     2

>> length(e)

ans =

     1
 
>> y = 5:1:11

y =

     5     6     7     8     9    10    11

```

## Exercise 5

```
>> g = 0:25

g =

  Columns 1 through 14

     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 15 through 26

    14    15    16    17    18    19    20    21    22    23    24    25

>> size(g)

ans =

     1    26

>> h = -10:10

h =

  Columns 1 through 14

   -10    -9    -8    -7    -6    -5    -4    -3    -2    -1     0     1     2     3

  Columns 15 through 21

     4     5     6     7     8     9    10

>> size(h)

ans =

     1    21

>> k = -10:0.1:10;
>> size(k)

ans =

     1   201

```

## Exercise 6

```
t = -10:0.1:10;
>> abs_t = abs(t);
>> x0 = t .* exp(-abs_t);
>> xe = abs_t .* exp(-abs_t);
>> x = 0.5 .* (x0 + xe);
>> layout = tiledlayout(2,2);
>> title(layout, "Exercise 6 Part 1");
>> nexttile
>> plot(t,x0)
>> title("x0 = te^{-|t|}")
>> xlabel("time")
>> ylabel("signal")
>> nexttile
>> plot(t,xe)
>> title("xe = |t|e^{-|t|}")
>> xlabel("time")
>> ylabel("signal")
>> nexttile
>> plot(t,x)
>> title("x = 0.5 * (x0 + xe)")
>> xlabel("time")
>> ylabel("signal")
```

```
>> x = 0:pi/100:2*pi;
>> y1 = 2 * cos(x);
>> y2 = cos(x);
>> y3 = 0.5 * cos(x);
>> plot(x,y1,"-r", x,y2,"--g", x,y3,":b")
>> xlabel("0 \leq x \leq 2\pi")
>> ylabel("Cosine Functions")
>> title("Exercise 6 Part 2")
>> legend('2*cos(x)','cos(x)','0.5*cos(x)')
```