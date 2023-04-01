


import 'package:signalr_netcore/signalr_client.dart';

class SignalRService {
  final String _hubUrl = 'https://yourdomain.com/gymhub';
  HubConnection? _hubConnection;

  Future<void> connectToGymHub(String userId) async {
    // Create a SignalR connection to the GymHub
    _hubConnection = HubConnectionBuilder().withUrl(_hubUrl).build();

    // Register a method to handle received notifications
    _hubConnection?.on('ReceiveNotification', (message) {
      // Handle the received notification message
    });

    // Start the SignalR connection and join the user to the hub group
    await _hubConnection!.start();
    await _hubConnection!.invoke('JoinGroup');
  }

  Future<void> disconnectFromGymHub() async {
    // Disconnect from the SignalR hub
    if (_hubConnection != null) {
      await _hubConnection!.stop();
      _hubConnection = null;
    }
  }
}