package test_open;

import java.io.*;

public class TestOpen {

	public static void main(String[] args) throws IOException {
		
		BufferedReader reader = new BufferedReader(new FileReader("file.txt"));
		String line = reader.readLine();
		reader.close();

	}

}
