# -*- coding: UTF-8 -*-

import pygame
import Utils
import TileType

# Verwaltet die Tileset Grafik und eine Liste mit Tile-Typen.
class Tileset(object):
    # Im Konstruktor laden wir die Grafik
    # und erstellen ein leeres Dictionary für die Tile-Typen.
    def __init__(self, image, colorkey, tile_width, tile_height):
        self.image = Utils.load_image(image, colorkey)
        self.tile_width = tile_width
        self.tile_height = tile_height
        self.tile_types = dict()
    
    # Neuen Tile-Typ hinzufügen.
    def add_tile(self, name, start_x, start_y):
        self.tile_types[name] = TileType.TileType(name, start_x, start_y, self.tile_width, self.tile_height)
        
    # Versuchen, einen Tile-Type über seinen Name in der Liste zu finden.
    # Falls der Name nicht existiert, geben wir None zurück.
    def get_tile(self, name):
        try:
            return self.tile_types[name]
        except KeyError:
            return None