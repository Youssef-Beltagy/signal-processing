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

>> h = -10:10

h =

  Columns 1 through 14

   -10    -9    -8    -7    -6    -5    -4    -3    -2    -1     0     1     2     3

  Columns 15 through 21

     4     5     6     7     8     9    10

>> size(g)

ans =

     1    26

>> size(h)

ans =

     1    21

>> k = -10:0.1:10

k =

  Columns 1 through 8

  -10.0000   -9.9000   -9.8000   -9.7000   -9.6000   -9.5000   -9.4000   -9.3000

  Columns 9 through 16

   -9.2000   -9.1000   -9.0000   -8.9000   -8.8000   -8.7000   -8.6000   -8.5000

  Columns 17 through 24

   -8.4000   -8.3000   -8.2000   -8.1000   -8.0000   -7.9000   -7.8000   -7.7000

  Columns 25 through 32

   -7.6000   -7.5000   -7.4000   -7.3000   -7.2000   -7.1000   -7.0000   -6.9000

  Columns 33 through 40

   -6.8000   -6.7000   -6.6000   -6.5000   -6.4000   -6.3000   -6.2000   -6.1000

  Columns 41 through 48

   -6.0000   -5.9000   -5.8000   -5.7000   -5.6000   -5.5000   -5.4000   -5.3000

  Columns 49 through 56

   -5.2000   -5.1000   -5.0000   -4.9000   -4.8000   -4.7000   -4.6000   -4.5000

  Columns 57 through 64

   -4.4000   -4.3000   -4.2000   -4.1000   -4.0000   -3.9000   -3.8000   -3.7000

  Columns 65 through 72

   -3.6000   -3.5000   -3.4000   -3.3000   -3.2000   -3.1000   -3.0000   -2.9000

  Columns 73 through 80

   -2.8000   -2.7000   -2.6000   -2.5000   -2.4000   -2.3000   -2.2000   -2.1000

  Columns 81 through 88

   -2.0000   -1.9000   -1.8000   -1.7000   -1.6000   -1.5000   -1.4000   -1.3000

  Columns 89 through 96

   -1.2000   -1.1000   -1.0000   -0.9000   -0.8000   -0.7000   -0.6000   -0.5000

  Columns 97 through 104

   -0.4000   -0.3000   -0.2000   -0.1000         0    0.1000    0.2000    0.3000

  Columns 105 through 112

    0.4000    0.5000    0.6000    0.7000    0.8000    0.9000    1.0000    1.1000

  Columns 113 through 120

    1.2000    1.3000    1.4000    1.5000    1.6000    1.7000    1.8000    1.9000

  Columns 121 through 128

    2.0000    2.1000    2.2000    2.3000    2.4000    2.5000    2.6000    2.7000

  Columns 129 through 136

    2.8000    2.9000    3.0000    3.1000    3.2000    3.3000    3.4000    3.5000

  Columns 137 through 144

    3.6000    3.7000    3.8000    3.9000    4.0000    4.1000    4.2000    4.3000

  Columns 145 through 152

    4.4000    4.5000    4.6000    4.7000    4.8000    4.9000    5.0000    5.1000

  Columns 153 through 160

    5.2000    5.3000    5.4000    5.5000    5.6000    5.7000    5.8000    5.9000

  Columns 161 through 168

    6.0000    6.1000    6.2000    6.3000    6.4000    6.5000    6.6000    6.7000

  Columns 169 through 176

    6.8000    6.9000    7.0000    7.1000    7.2000    7.3000    7.4000    7.5000

  Columns 177 through 184

    7.6000    7.7000    7.8000    7.9000    8.0000    8.1000    8.2000    8.3000

  Columns 185 through 192

    8.4000    8.5000    8.6000    8.7000    8.8000    8.9000    9.0000    9.1000

  Columns 193 through 200

    9.2000    9.3000    9.4000    9.5000    9.6000    9.7000    9.8000    9.9000

  Column 201

   10.0000

>> k = -10:0.1:10;
>> size(k)

ans =

     1   201

```

## Exercise 6

```
>> t = -10:0.1:10;
>> x0 = t .* exp(-abs(t));
>> plot(t,x0);
>> t = -10:0.1:10;
>> x0 = t .* exp(-abs(t));
>> abs_t = abs(t);
>> xe = abs_t .* exp(-abs_t);
>> x = 0.5 * (x0 + xe)

x =

  Columns 1 through 8

         0         0         0         0         0         0         0         0

  Columns 9 through 16

         0         0         0         0         0         0         0         0

  Columns 17 through 24

         0         0         0         0         0         0         0         0

  Columns 25 through 32

         0         0         0         0         0         0         0         0

  Columns 33 through 40

         0         0         0         0         0         0         0         0

  Columns 41 through 48

         0         0         0         0         0         0         0         0

  Columns 49 through 56

         0         0         0         0         0         0         0         0

  Columns 57 through 64

         0         0         0         0         0         0         0         0

  Columns 65 through 72

         0         0         0         0         0         0         0         0

  Columns 73 through 80

         0         0         0         0         0         0         0         0

  Columns 81 through 88

         0         0         0         0         0         0         0         0

  Columns 89 through 96

         0         0         0         0         0         0         0         0

  Columns 97 through 104

         0         0         0         0         0    0.0905    0.1637    0.2222

  Columns 105 through 112

    0.2681    0.3033    0.3293    0.3476    0.3595    0.3659    0.3679    0.3662

  Columns 113 through 120

    0.3614    0.3543    0.3452    0.3347    0.3230    0.3106    0.2975    0.2842

  Columns 121 through 128

    0.2707    0.2572    0.2438    0.2306    0.2177    0.2052    0.1931    0.1815

  Columns 129 through 136

    0.1703    0.1596    0.1494    0.1397    0.1304    0.1217    0.1135    0.1057

  Columns 137 through 144

    0.0984    0.0915    0.0850    0.0789    0.0733    0.0679    0.0630    0.0583

  Columns 145 through 152

    0.0540    0.0500    0.0462    0.0427    0.0395    0.0365    0.0337    0.0311

  Columns 153 through 160

    0.0287    0.0265    0.0244    0.0225    0.0207    0.0191    0.0176    0.0162

  Columns 161 through 168

    0.0149    0.0137    0.0126    0.0116    0.0106    0.0098    0.0090    0.0082

  Columns 169 through 176

    0.0076    0.0070    0.0064    0.0059    0.0054    0.0049    0.0045    0.0041

  Columns 177 through 184

    0.0038    0.0035    0.0032    0.0029    0.0027    0.0025    0.0023    0.0021

  Columns 185 through 192

    0.0019    0.0017    0.0016    0.0014    0.0013    0.0012    0.0011    0.0010

  Columns 193 through 200

    0.0009    0.0009    0.0008    0.0007    0.0007    0.0006    0.0005    0.0005

  Column 201

    0.0005

>> x = 0.5 * (x0 + xe);
>> tiledlayout(2,2);
>> layout = tiledlayout(2,2);
>> title(layout, "Exercise 6");
Error using title (line 31)
Incorrect number of input arguments
 
>> help titile
--- titile not found. Showing help for title instead. ---

 title  Graph title.
    title('text') adds text at the top of the current axis.
 
    title('text','Property1',PropertyValue1,'Property2',PropertyValue2,...)
    sets the values of the specified properties of the title.
 
    title(AX,...) adds the title to the specified axes.
 
    H = title(...) returns the handle to the text object used as the title.
 
    See also xlabel, ylabel, zlabel, text.

    Documentation for title

>> layout = tiledlayout(2,2);
>> title(layout, "Exercise 6");
>> nexttile
>> plot(t,x0)
>> title("x0 = te^(-|t|))")
>> title("x0 = te\^(-|t|))")
>> title("x0 = te\^(-|t|)")
>> title("x0 = te^{-|t|}")
>> nexttile
>> plot(t,xe)
>> title("xe = |t|e^{-|t|}")
>> nexttile
>> plot(t,x)
>> title("x = x0 + xe")
>> title(layout, "Exercise 6 Part 1");
>> 
```

```
>> x = 0:pi/100:2*pi;
>> y1 = 2 * cos(x);
>> y2 = cos(x);
>> y3 = 0.5 cos(x);
 y3 = 0.5 cos(x);
          ↑
Error: Invalid expression. Check for missing multiplication operator,
missing or unbalanced delimiters, or other syntax error. To construct
matrices, use brackets instead of parentheses.
 
>> y3 = 0.5 * cos(x);
>> plot(x,y1,"-r", x,y2,"--g", x,y3,":b")
>> plot(x,y1,"-r", x,y2,"--g", x,y3,":b")
>> xlabel("0 \leq x \leq 2\pi")
>> ylabel("Cosine Functions")
>> ylabel("Cosine Functions")
>> title("Exercise 6 Part 2")
>> legend('x*cos(x)','cos(x)','0.5*cos(x)')
>> legend('2*cos(x)','cos(x)','0.5*cos(x)')
>> legend('2*cos(x)','cos(x)','0.5*cos(x)')
>> plot(x,y1,"-r", x,y2,"--g", x,y3,":b")
>> xlabel("0 \leq x \leq 2\pi")
>> ylabel("Cosine Functions")
>> title("Exercise 6 Part 2")
>> legend('2*cos(x)','cos(x)','0.5*cos(x)')
```