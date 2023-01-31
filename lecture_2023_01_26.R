# EL Hoffman
# 2023-01-26
# following along Boolean and elseif lecture 

## fuckin around
vec=c(1,0,2,1)
vec[c(F,T,T,F)]
vec[1]>vec[2]
vec[1]==vec[4]
3 %in% vec
2>c(1,2,3)
c(1,2,3)>c(3,2,1) # 1.1>2.1? 1.2>2.2? etc, but it's messy don't do this
c(1,2,3) %in% c(1,2,3,4,5)
c(1,2)%in%c(4,5,6)
c(1,2,3,4)%in%c(3,4,5)

## now with data frames

world_oceans = data.frame(ocean = c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"),area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6),avg_depth_m = c(3926, 4028, 3963, 3953, 4500))
world_oceans
world_oceans$avg_depth_m > 4000

deep_oceans=world_oceans[world_oceans$avg_depth_m > 4000, ] # DONT FORGET COLMS AS WELL AS ROWS df[#, ]
deep_oceans
sum(world_oceans$avg_depth_m > 4000)

## imprecise numerics
1+2 == 3 # T
0.1+0.2 == 0.3 # F, bc compjuter binary is funky
0.3-(0.1+0.2) # not actually 0 :/

my_error=0.0001
abs((0.3-(0.1+0.2)))>my_error

## boolean operators
abs((0.3-(0.1+0.2)))<my_error & abs((0.4-(0.2+0.2)))<my_error # and
0.3>0.4|0.4>0.3 # or
any(0.3==0.3,0.3>0.4,5<6,7==7) # any T?
all(0.3==0.3,0.3>0.4,5<6,7==7) # all T?

x=5
x>10|x%in%c(5,10,15)
x>10&x%in%c(5,10,15)


world_oceans$ocean[world_oceans$avg_depth_m>4000 & world_oceans$area_km2<50e6]
world_oceans[world_oceans$avg_depth_m>4000 | world_oceans$area_km2<50e6, ]

z=c(T,F,F)
any(world_oceans$avg_depth_m>4000)
all(z)

## NA
# not numbers

# NA==NA # returns NA lmao
# c(1,2,3,NA)==NA

is.na(c(1,2,3,NA)) # use is.na instead
!is.na(c(1,2,3,NA))


#################### 
# if else section
#################### 

## if
num=-2
num

if (num<0) {
  print("Oh no it's negative!")
  num=num*-1
  print("No worries, I made it positive")
}
num

temp=98.4
temp=99.1
temp=102

if (temp>98.6) {
  print("Low fever!")
  cat(temp-98.6, "degrees too high")
  if (temp>101) {
    print("Oh no, a high fever!")

  }
}

## now else

grade=56

if(grade>=60){
  print("You passed!")
}else {
  print("You failed :(")
}


a=63
b=63

if(a>b){
  print("a wins!")
} else if(a<b){
  print("b wins!")
} else {
  print("a and b tied!")
}


# Let’s say you have the number of donuts your Dad bought on Sunday stored in variable n_donuts. Write an if/else chain to print out a statement that states whether Dad bought less than a dozen, a dozen (12), a baker’s dozen (13) or more than a baker’s dozen

donuts=15

if (donuts<12) {
  print("Dad got less than a dozen donuts (lame)")
} else if(donuts==12) {
  print("Dad got a dozen donuts (nice)")
} else if(donuts==13) {
  print("Dad got a BAKER'S dozen of donuts (NICE)")
} else {
  print("Dad got more than a baker's dozen of donuts (SUPER nice)")
}

## ifelse

a = 2 
ifelse(a>0,1/a,NA) # ifelse(if this condition, do this, else this)

a=c(0,1,2,-3,4)
reciprocals= ifelse(a!=0,1/a,NA)
cbind(a,reciprocals)
