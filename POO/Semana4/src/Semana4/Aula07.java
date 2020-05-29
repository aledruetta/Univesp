package Semana4;

import java.util.*;

public class Aula07 {
	public static void main(String[] args) {
		List <String> arrayList = new ArrayList<String>();
		List <Integer> linkedList = new LinkedList<Integer>();
		
		for (int i = 0; i < 5; i++) {
			arrayList.add("a" + i);
			linkedList.add(i, Integer.valueOf(i));
		}
		
		for (int j = 0; j < arrayList.size(); j++) {
			System.out.println(arrayList.get(j));
		}
		for (Integer obj : linkedList) {
			System.out.println(obj);
		}
		System.out.println(linkedList.contains(5));
	}
}
