import turtle
import random
def tree(t, trunkLength):
    if trunkLength < 5:
        return
    else:
        angle = random.randint(35,40)
        branch = random.randint(12,18)
        t.speed(angle*0)
        t.forward(trunkLength)
        t.right(angle)
        tree(t, trunkLength-branch)
        t.left(2*angle) #twice the angle
        tree(t, trunkLength-branch)
        t.right(angle)
        t.backward(trunkLength)

t = turtle.Turtle()
t.left(90)
