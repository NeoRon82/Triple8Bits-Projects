# -*- coding: UTF-8 -*-

import pygame
import Tileset
import Player

# Die Tilemap Klasse verwaltet die Tile-Daten, die das Aussehen der Karte beschreiben.
class Tilemap(object):
    def __init__(self):
        # Wir erstellen ein neues Tileset.
        # Hier im Tutorial fügen wir manuell vier Tile-Typen hinzu.
        self.tileset = Tileset.Tileset("tileset.png", (255, 0, 255), 32, 32)
        self.tileset.add_tile("grass", 0, 0)
        self.tileset.add_tile("mud", 32, 0)        
        self.tileset.add_tile("grass-mud", 0, 64)
        self.tileset.add_tile("empty", 0, 96)
        
        # Festlegen der Startposition der Kamera. Hier (0, 0).
        self.camera_x = 0
        self.camera_y = 0
        
        # Die Größe der Maps in Tiles.
        self.width = 30
        self.height = 25

        # Erstellen einer leeren Liste für die Tile Daten.
        self.tiles = list()
                
        # Sehr einfache Karte basteln:
        for i in range(0, self.height):
            self.tiles.append(list())
            for j in range(0, self.width):
                if i == 14:
                    self.tiles[i].append("grass") 
                elif i == 15:
                    self.tiles[i].append("grass-mud")
                elif i > 15:
                    self.tiles[i].append("mud")
                else:
                    self.tiles[i].append("empty")
        
        # Player-Objekt erstellen.
        self.player = Player.Player()
                    
    
    # Hier rendern wir den sichtbaren Teil der Karte.
    def render(self, screen):
        # Zeilenweise durch die Tiles durchgehen.
        for y in range(0, int(screen.get_height() / self.tileset.tile_height) + 1):
            # Die Kamera Position mit einbeziehen.
            ty = y + self.camera_y
            if ty >= self.height or ty < 0:
                continue
            # Die aktuelle Zeile zum einfacheren Zugriff speichern.
            line = self.tiles[ty]
            # Und jetzt spaltenweise die Tiles rendern.
            for x in range(0, int(screen.get_width() / self.tileset.tile_width) + 1):
                # Auch hier müssen wir die Kamera beachten.
                tx = x + self.camera_x
                if tx >= self.width or tx < 0:
                    continue
                # Wir versuchen, die Daten des Tiles zu bekommen.
                tilename = line[tx]
                tile = self.tileset.get_tile(tilename)
                # Falls das nicht fehlschlägt können wir das Tile auf die screen-Surface blitten.
                if tile is not None:
                    screen.blit(self.tileset.image, (x * self.tileset.tile_width, y * self.tileset.tile_height), tile.rect)
        
        # Und zuletzt den Player rendern.
        self.player.render(screen)

        
    # Tastendrücke an den Player weiterreichen:
    def handle_input(self, key):        
        self.player.handle_input(key)           