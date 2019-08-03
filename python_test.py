
def isNumber(s) : 
      
    for i in range(len(s)) : 
        if s[i].isdigit() != True : 
            return False
  
    return True

def age():
    x = input("Please enter you age: ")
    if isNumber(x):
        x = int(x)
        if x <= 20:
            print('you are young')
        elif x > 20 and x < 30:
            print('you are middle age')
        elif x >= 30 and x < 40:
            print('you have mid life crisis')
        else:
            print('you are old')
    else:
        print('isnt a integer')

def name():

    a = input("Please enter your name: ")
     
    print('Name', a, "Länge deines Namens", 3)

def range():

    startnum = input("Gebe die Start nummer ein")
    endnum = input("Gebe die letzte nummer ein")
    stepnum = input("Gebe die Step nummer ein")

    result = range(int(startnum), int(endnum), int(stepnum))

    print(list(result))

def fib(n): 
    """Print the Fibonacci series up to n."""
    a, b = 0, 1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
    print()

def ask_ok(prompt, retries=4, complaint='Bitte Ja oder Nein!'):
   while True:
       ok = input(prompt)
       if ok in ('j', 'J', 'ja', 'Ja'): return True
       if ok in ('n', 'N', 'nein' 'Nein'): return False
       retries = retries - 1
       if retries < 1:
            print('Benutzer abgelehnt!')
            break
       print(complaint, retries)
#ask_ok("Willst du wirklich aufhören?")
