	const socket1 = io()
	
	socket1.on('chat-message', data => {
	    console.log(data)
	})