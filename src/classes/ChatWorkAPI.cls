public with sharing class ChatWorkAPI {
	public ChatWorkAPI() {
		
	}

	/**
	* メッセージを投稿する
	* @auther yajima 2014/08/23
	*/
	public void postMessage(String message){
		String taken = getTokenKey();
		String roomId = getRoomId();
	}



	/**
	* チャットワークのトークンを取得する
	* @auther yajima 2014/08/23
	*/
	private String getTokenKey(){
		return '2aee3c6709db213340174284008dc2c1';
	}

	/**
	* 投稿するroomIDを取得する
	* ココらへんデータベースがあるとよい
	* @auther yajima 2014/08/23
	*/
	private String getRoomId(){
		return '20771185';
	}
}