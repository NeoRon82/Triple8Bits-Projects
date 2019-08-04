# -*- coding: UTF-8 -*-

import pygame

# Die Klasse kümmert sich um eine einfache Animation:
class Animation(object):
    def __init__(self, image, start_x, start_y, num, width, height, duration):
        # Die Surface speichern,
        # alle Einzelbilder müssen in einer Reihe liegen.
        self.image = image
        
        # Dazu müssen wir wissen, an welcher Position die Frames beginnen,
        # wie viele Frames die Animation hat,
        # sowie die Breite und Höhe der Animation kennen.
        self.start_x = start_x
        self.start_y = start_y
        self.num = num
        self.width = width
        self.height = height
        
        # Und natürlich auch, nach welchem Zeitraum wir das nächsten Frame anzeigen sollen.
        self.duration = duration
        
        # Die aktuelle Zeit und das aktuellen Frame speichern wir ebenfalls.
        self.time = 0
        self.current = 0
        
    
    # Die update-Methode rufen wir einmal pro Frame auf:
    def update(self, time=1):
        # Die vergangene Zeit addieren
        self.time += time
        
        # Falls wir den Anzeige-Zeitraum überschreiten, ...
        if self.time > self.duration:
            # ... setzten wir die Zeit zurück und gehen zum nächsten Frame.
            self.time = 0
            self.current += 1
            # Sicherstellen, dass das aktuelle Frame auch verfügbar ist.
            if self.current >= self.num:
                self.current = 0
                
    
    # Das aktuelle Frame an einer bestimmten Position rendern:
    def render(self, screen, pos):
        # Welchen Bereich aus der Grafik müssen wir anzeigen?
        # Die x-Position können wir aus der Breite und der Start-Position berechnen,
        # die restlichen Werte kennen wir bereits.
        screen.blit(self.image, pos, pygame.Rect(self.start_x + (self.width * self.current), self.start_y, self.width, self.height))