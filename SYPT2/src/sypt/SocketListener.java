package sypt;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.sun.mail.util.SocketConnectException;

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
					byte[] inputBuf = new byte[100];
					Socket sock = null;
					try {
						sock = serverSocket.accept();
						System.out.println("ServerSocket accept Client Socket..............");
						BufferedInputStream bis = new BufferedInputStream(sock.getInputStream());
						int in;
						
						while((in = bis.read(inputBuf)) != -1){
							System.out.println(new String(inputBuf));
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
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
