package socket;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.ServerSocket;

public class LED_Socket {
	static Socket socket = null;

	public void connect() {
		
		try {
			int port = 51515;
			ServerSocket socketServer = new ServerSocket(port);
			socket = socketServer.accept();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public void led_off() {
		try {
			// int port = 8112;//
			// ServerSocket socketServer = new ServerSocket(port);//
			// Socket socket = socketServer.accept();//
			DataOutputStream sendWriter = new DataOutputStream(socket.getOutputStream());
			String sendString;
			sendString = "0";
			sendWriter.writeUTF(sendString);
			sendWriter.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void led_on() {
		try {
			//int port = 8112;//
			 //ServerSocket socketServer = new ServerSocket(port);//
			//Socket socket = socketServer.accept();//
			DataOutputStream sendWriter = new DataOutputStream(socket.getOutputStream());
			String sendString;
			sendString = "1";
			sendWriter.writeUTF(sendString);
			sendWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public String gps() {
		try {
			DataOutputStream sendWriter = new DataOutputStream(socket.getOutputStream());
			String sendString;
			sendString = "3";
			sendWriter.writeUTF(sendString);
			sendWriter.flush();

			BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream(), "UTF-8"));
			String receiveString;
			receiveString = in.readLine();
			
			return receiveString;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
}