default(realprecision, 100);

S(x) = sin(x / 180 * Pi);
C(x) = cos(x / 180 * Pi);
AT(x) = atan(x) * 180 / Pi;
f(a, b, c, d) = S(b+c+d) * S(a) * S(c);
g(a, b, c, d) = S(b) * S(d - a) + S(b+c+d) * S(a) * C(c);
h(a, b, c, d) = if(g(a, b, c, d)==0, 90, AT(f(a, b, c, d) / g(a, b, c, d)));
cnt = 0;
\\ a<d, a+b+c<180, b+c+d<180
for(a=1, 179, for(b=1, 179-a, for(d=a+1, 179, for(c=1, min(179-a-b, 179-b-d), e=h(a, b, c, d); if(abs(e-round(e))<1e-50;, cnt++)))));
print(cnt);
