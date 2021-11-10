#rule = "BBBAAAAB"
#rule = "BAABAAAB" #110
rule = "BABAABAB" #90       
axiom = "BBBBBBBBBBBBBBBBABBBBBBBBBBBBBBBB"
#axiom = "ABABBBABBBABBBBABBABB"
gen = axiom
x = 0
y = 0
sz = 0


def setup():
    global gen, x, y, sz
    size(400,800)
    background(64)
    noStroke()
    sz =width/len(axiom)
    rect((((len(axiom)-1)/2)*sz),0,sz,sz)
    y=1 #printed the first square
    frameRate(4)
    
    

    
    
def draw():
    global gen, x, y, sz
    gen, v= replaceIt(gen)
    
    plotline(gen)
    print(frameCount,'\t', gen, v)
    if y*sz > height:
        y =0
        background(64)    
    
 
def plotline(gen):
    global y, sz ,x
    for ind, letter in enumerate(gen):
        if letter == 'A':
            fill(255)
        else:
            fill(64)
        rect(ind*sz,y*sz,sz,sz)
    y=y+1
        
    
def replaceIt(currGen):
    global rule
    nextGen = ""
    v=""
    for i in range(len(currGen)):
        threeText = currGen[(i-1)%len(currGen)] + currGen[i] + currGen[(i+1)%len(currGen)]
        if threeText == "AAA":              
            nextGen = nextGen + rule[0]
            v=v+" "
            
        elif threeText == "AAB":
            nextGen = nextGen + rule[1]
            v=v+"#"
            
        elif threeText == "ABA":
            nextGen = nextGen + rule[2]
            v=v+" "
            
        elif threeText == "ABB":
            nextGen = nextGen + rule[3]
            v=v+"#"
            
        elif threeText == "BAA":
            nextGen = nextGen + rule[4]
            v=v+"#"
            
        elif threeText == "BAB":
            nextGen = nextGen + rule[5]
            v=v+" "
            
        elif threeText == "BBA":
            nextGen = nextGen + rule[6]
            v=v+"#"
            
        elif threeText == "BBB":
            nextGen = nextGen + rule[7]
            v=v+" "
            
    return nextGen, v
