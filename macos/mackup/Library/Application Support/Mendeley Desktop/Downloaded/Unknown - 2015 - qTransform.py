import numpy

u = numpy.matrix([[1.00170269,0.00098062],[0.00098062,1.00068567]])
e, x = numpy.linalg.eig(numpy.array(u))
y = numpy.matrix([[-0.00645177,-0.00439483],[-0.00828979,-0.00641945]])
t = numpy.matrix([[-0.01290354,-0.00878967],[-0.01657959,-0.01283889]])
v = numpy.zeros((2,2))
f = numpy.zeros((2,2))
z = numpy.zeros((2,2))
#w = numpy.array((2))

d = numpy.zeros((2,2))
a = numpy.zeros((2,2))
b = numpy.zeros((2,2))
c = numpy.zeros((2,2))

g = numpy.zeros((2,2))
p = numpy.zeros((2,2))

#print(u)
#print(y)
print(x)
print(e)
for i in range (0,2):
    for j in range (0,2):
        print("i,j,x[i,j]",i,j,x[i,j])

for k in range (0,2):
	for j in range (0,2):
		for i in range (0,2):
			d[j,k] += x[i,j] * t[i,k]
print("D")
print(d)
for k in range (0,2):
	for j in range (0,2):
		for i in range (0,2):
			a[k,j] += d[j,i] * x[i,k]
#print("A")
#print(a)
for i in range (0,2):
	for j in range (0,2):
		for k in range (0,2):
			c[i,j] += x[i,k] * x[j,k] * a[k,k] * pow(e[k],-2) * -1
print("C")
print(c)

# for k in range (0,2):
# 	for l in range (0,2):
# 		if (k != l and e[k] != e[l]):
# 			for i in range (0,2):
#                 for j in range (0,2):
#                     g[k,l] += x[j,k] *x[i,l]* a[i,,]j* (pow(e[k],-1) - pow(e[l],-1))/(e[k] - e[l])
# print("G")
# print(g)

for i in range (0,2):
	for j in range (0,2):
		for k in range (0,2):
			p[k,j] += x[k,i] * g[i,j]
print("P")
print(p)

for k in range (0,2):
	w =0.0
	for i in range (0,2):
		for j in range (0,2):
			w += x[i,k] * x[j,k] * t[i,j]
	w *= pow(e[k],-2) * -1
	for m in range (0,2):
		for n in range (0,2):
			z[m,n] += x[m,k] * x[n,k] * w
print(z)
print(w)

for k in range (0,2):
	for l in range (0,2):
		if (k != l and e[k] != e[l]):
			for i in range (0,2):
				for j in range (0,2):
					v[k,l] += x[l,i] * x[k,j]  * t[i,j]
			v[k,l] *= (pow(e[k],-1) - pow(e[l],-1))/(e[k] - e[l])
		for m in range (0,2):
			for n in range (0,2):
				f[m,n] += x[l,m] * x[k,n] * v[k,l]
print("V")
print(z)
print(f)

#for i in range (0,2):
#	for j in range (0,2):
#		for k in range (0,2):
#			b[i,j] += x[i,k] * x[j,k]
#print(b)
