library(MASS) #has datasets to access
library(ISLR) #own library with datasets in the book

### Simple linear Regression 
names(Boston) #names of the variables of dataset Boston
?Boston
plot(medv~lstat, data = Boston)
fit1=lm(medv~lstat, data=Boston)
fit1
summary(fit1)
#add linear fit to the plot
abline(fit1, col="red") #pick up a linear model 
names(fit1)
confint(fit1) #finds you a confidence interval for the fit
predict(fit1, data.frame(lstat=c(5,10,15)), interval = "confidence") 
#query a linear model fit
#predict with 3 new values for lstat, not only ask for predictions but also 
#confidence intervals

### Multiple linear regression
fit2=lm(medv~lstat+age, data=Boston)
summary(fit2)
#R squared the higher the better, percentage of the variance explained
#F statistics if we drop both of the predictors in this model

fit3=lm(medv~., data = Boston) #suppose to use all the other variables 
#in the Boston data frame except medv, which is the response, all the 
#others will be predictors
summary(fit3) 
#age is no longer significant, a lot of other predictors are very correlated 
#with age, in the presence of them, age is no longer required

par(mfrow=c(2,2)) #two by two layout
plot(fit3) #gives you various views of a linear model
#1st one is the residuals against the fitted values (non-linearity)
#2nd one gives you aspect of the linear model fit
#3rd one is the square root of the absolute standardized residuals, to check if 
#the variance is changing with the mean or the fit
fit4=update(fit3,~.-age-indus)
#you fit a model fit3, you can update it with the formula we give is twiddle dot-age,
#using the same response, whatever the model was in fit3 that is replaced
#with dot and minus age means want to remove age, also indus
#this will fit the model with those two variables removed and all others in
summary(fit4)
#everything left in the model appears to be significant

### Nonlinear terms and Interactions
fit5=lm(medv~lstat*age,Boston)
summary(fit5)
#star means that we are going to have main effects for each and the
#interaction, and the pure interaction is indicated by :
#while the main effect for age is not significant here, the interaction is

fit6=lm(medv~lstat + I(lstat^2),Boston); summary(fit6)
#we fit lstat, and we saw there was a nonlinear looking scatter plot between 
#medv and lstat, so we put in a quadratic term, 2 things going on here:
#the quadratic we indicate by lstat power 2, but power has a meaning in this 
#formula language and so if want to just raise lstat to the power 2, 
#we protected with this identity function so the formula language doesn't
#dig inside this identity function

#we put two commands in one line which you can do in R but have to separate them
#with a semicolon

attach(Boston)
#the named variables in Boston are available in our data space
par(mfrow=c(1,1)) #single pane plot layout
plot(medv~lstat)

#cannot use abline anymore that only works on straight line fit
#get the fitted value from our quadratic fit and include them in the plot
points(lstat,fitted(fit6), col="red",pch=20)

#easy way to fit polynomials,
fit7=lm(medv~poly(lstat,4))
#fit medv as a polynomial of degree4 in lstat, add to plot with color blue
points(lstat, fitted(fit7), col="blue",pch = 20)
#overfit the data

#plotting characters available 
plot(1:20, 1:20,pch=1:20,cex=2)
#cex = 3 means want to enlarge those plotting characters cter by2, double the size

###Qualitative predictors
fix(Carseats)
#fix is a way of throwing up an editor in R
names(Carseats)
summary(Carseats)
fit1=lm(Sales~.+Income:Advertising+Age:Price, Carseats)
summary(fit1)
contrasts(Carseats$ShelveLoc)
#contrast shows you how R will code that variable when it's put in a linear model
#three level factor and so it puts in two dummy variables and 

###Writing R function
regplot=function(x,y){
  fit=lm(y~x)
  plot(x,y)
  abline(fit,col="red")
}

attach(Carseats)
regplot(Price,Sales)

regplot=function(x,y,...){#these are unnamed arguments but you're allowed to
  #add extra arguments and they all get passed on exactly as they supplied
  fit=lm(y~x)
  plot(x,y)
  abline(fit,col="red")
}

regplot(Price,Sales,xlab="Price",ylab="Sales",col="blue",pch=20)