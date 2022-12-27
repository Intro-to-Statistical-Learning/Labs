### vectors, data, matrices, subsetting
x=c(2,7,5)
x
y=seq(from=4, length=3, by=3)
?seq
y
x+y
x/y
x^y
x[2]
x[2:3] #starts from 2nd element, ends at 3rd element
x[-2] #remove element two from x and return the subsetted vector
x[-c(1,2)] #remove the collection of indices 1&2

z=matrix(seq(1,12),4,3) #matrix is a two-way array
#(autual numbers in the matix, dimension 4 and 3), 4 by 3 matrix
z
z[3:4, 2:3] #subset element of a matrix, 3rd and 4th row, 2nd and 3rd column
z[, 2:3] #just get the columns, gives the 2nd and 3rd column of z
z[, 1] # 1st column of z, that become a vector, actually dropped its matrix status 
z[, 1, drop=FALSE] #keeps the one column matrix as a matrix and not a vector
dim(z) #query the dimensiom of the matrix atom of z
ls() #tells you what you have available in you working directory
rm(y) #clean up your working directory

### Generating random data, graphics
x=runif(50) #random uniform, create 50 random uniforms on 0 and 1, 
x
y=rnorm(50) #random norm, random Gaussian random normal variables, 50 standard random normal variables
y
plot(x,y)
plot(x,y, xlab = "Random Uniform", ylab = "Random Normal", pch = "*", col = "blue")
par(mfrow = c(2,1)) #mfrow: have a panel of plots and with two rows and one column
plot(x,y)
hist(y)
par(mfrow=c(1,1))


### Reading in Data
Auto=read.csv("~/desktop/Rsessions/Auto.csv")
names(Auto) #name of the variables
dim(Auto) #dimension of the data
class(Auto)
summary(Auto) #summary of each variable in the data frame
plot(Auto$cylinders, Auto$mpg)
plot(Auto$cyl, Auto$mpg)
attach(Auto) #attach the data frame, creates a workspace with all the names variables
# now you can access them by name
search() #tell us our various workspace
plot(cylinders, mpg)
cylinders=as.factor(cylinders)


