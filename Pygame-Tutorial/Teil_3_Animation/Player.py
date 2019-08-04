# -*- coding: UTF-8 -*-

import pygame
import Utils
import Animation

# Die Player Klasse verwendet zwei Animationen, um eine steuerbare Spielfigur dazustellen.
class Player(object):
    def __init__(self):
        # Bild laden und erste Animation erstellen: 
        self.anim_image_right = Utils.load_image("tileset.png", (255, 0, 255))
        self.anim_right = Animation.Animation(self.anim_image_right, 32, 32, 2, 32, 64, 15)  
        
        # Die Grafik spiegeln und in einer neuen Surface speichern,
        # dann können wir die linke Animation erstellen.
        self.anim_image_left = pygame.transform.flip(self.anim_image_right, True, False)
        self.anim_left = Animation.Animation(self.anim_image_left, 32, 32, 2, 32, 64, 15)
        
        # Start-Position des Players festlegen und
        # merken in welche Richtung wir schauen und ob wir überhaupt laufen.
        self.pos_x = 10*32
        self.pos_y = 13*32        
        self.dir = 0
        self.walking = False
        
        
    def render(self, screen):
        # Die Blickrichtung ist links:
        if self.dir == -1:
            # Wenn der Spieler die linke oder rechte Pfeiltaste gedrückt hat sind wir am laufen,
            if self.walking:                
                # nur dann die Animation updaten.
                self.anim_left.update()
            # Blickrichtung links rendern.
            self.anim_left.render(screen, (self.pos_x, self.pos_y))   
        else:
            # Und das gleiche nochmal für rechts:
            if self.walking:
                self.anim_right.update()
            self.anim_right.render(screen, (self.pos_x, self.pos_y))
        
        # De Laufen-Zustand zurücksetzen, im nächsten Frame bleiben wir stehen.
        self.walking = False
        
    
    def handle_input(self, key):
        # Linke Pfeiltaste wird gedrückt:
        if key == pygame.K_LEFT:
            # x-Position der Spielfigur anpassen,
            # die Blickrichtung festlegen
            # und den Laufen-Zustand einschalten.
            self.pos_x -= 1
            self.dir = -1
            self.walking = True
        
        # Und nochmal für die rechte Pfeiltaste.
        if key == pygame.K_RIGHT:
            self.pos_x += 1
            self.dir = 1
            self.walking = True