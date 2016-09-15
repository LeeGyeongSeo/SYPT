package sypt;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.sun.mail.util.SocketConnectException;

import sun.security.krb5.internal.crypto.Des;

public class SocketListener implements HttpSessionListener{


	ServerSocket serverSocket;
	
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		try {
			serverSocket = new ServerSocket(5000);
			System.out.println("ServerSocket Created...............");
			Runnable SocketHandler = new Runnable() {
				@Override
				public void run() {
					// TODO Auto-generated method stub

					Socket sock = null;
					try {
						sock = serverSocket.accept();
						System.out.println("ServerSocket accept Client Socket..............");
						DataInputStream dis = new DataInputStream(sock.getInputStream());
						JSONObject obj = new JSONObject();
						int size = dis.readInt();
				        byte[] inputBuf = new byte[size];
						while(dis.read(inputBuf) != -1){
							
							//String str = new String(inputBuf, 0, inputBuf.length, "ISO-8859-1");
							String str = new String(inputBuf, "UTF-8");
							System.out.println(str);
							
							
							writeJSON(str, obj);
							size = dis.readInt();
							inputBuf = new byte[size];
						}
						sock.close();
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					
				}
			};
			new Thread(SocketHandler).start();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		try {
			serverSocket.close();
			System.out.println("ServerSocket Closed...........");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void writeJSON(String str, JSONObject obj) {
		obj.put("sendString", str);

		FileWriter file = null;
		try {

			file = new FileWriter("./file.json");
			file.write(obj.toJSONString());
			System.out.println("Successfully Copied JSON Object to File...");
			System.out.println("\nJSON Object: " + obj);
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			try {
				file.flush();
				file.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
