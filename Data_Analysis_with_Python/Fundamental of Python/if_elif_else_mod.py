# if Statement
x = 4
if x % 2 == 0: # if you divide x by 2 then the remainder equals to 0
    print("x is even number") # statemen aksi lebih menjorok ke dalam
    
# Statement if ... elif ... else
x = 106
if x % 2 == 0: # if you divide x by 2 then the remainder will be 0
    print("x is divisible by two, x is even number!")
elif x % 3 == 0: # if you divide x by 3 then the remainder will be 0
    print("x is divisible by three")
elif x % 5 == 0: #  if you divide x by 5 then the remainder will be 0
    print("x is divisible by five")
else:
    print("x is not divisible by two, three or five")
