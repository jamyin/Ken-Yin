package com.jam.pattern.abstractFactory;

import com.jam.pattern.factory.Shape;

public abstract class AbstractFactory {
	abstract Color getColor(String color);
	abstract Shape getShape(String shape) ;

}
