// console.log('client side js')
// $('body').append($('<p>Hey JQ</p>'))

const deleteItem = (itemId) => {
	console.log("delete " + itemId)
	$.ajax({
		url: '/items/j/' + itemId,
		method: 'DELETE',
		dataType: 'JSON',
		success: getItems,
		fail: (err)=>{
			console.error(err)
		}
	})
}

const editItem = (itemId) => {
	console.log("edit " + itemId)
		$.ajax({
		url: '/items/j/edit/' + itemId,
		method: 'GET',
		dataType: 'JSON',
		success: showEditor,
		fail: (err)=>{
			console.error(err)
		}
	})
}

const updateItem = (itemId) => {
	console.log("updating item" + itemId);

	const title = $(#update-item).val();

	$.ajax({
		$.ajax({
		url: '/items/j/' + itemId,
		method: 'GET',
		dataType: 'JSON',
		success: getItems,
		fail: (err)=>{
			console.error(err)
		}



	})
}

const showEditor = (data) => {
	console.log(data)
	const $items = $('#items li');
	let which;
	for (let i of $items) {
		let thisIndex = $(i).data('thisitem');
		if (thisIndex == data.item.id) {
			which = i 
			break;
		}
	}
	const $theItem = $(which);
	const $form = $('<div>');
	const $input = $('<input id="update-item" type="text" name="title" value="' +data.item.title +'">')
	$form.append($input)
	const $button = $('<button data-action="update">').text('update item');
	$form.append($button);
	$theItem.append($form);
}

$('#items').on('click', 'li', (event)=>{
	const itemId = $(event.currentTarget).data('thisitem');
	const action = $(event.target).data('action');

	if (action === "delete") deleteItem(itemId);
	if (action === "edit") editItem(itemId);
	if (action === "update") updateItem(itemId);
})

$('#add-item').on('click', (event)=>{
	const title = $('#new-item').val();
	$.ajax({
		url: '/items/j',
		method: 'POST',
		dataType: 'JSON',
		data: {
			title: title
		},
		success: (data)=>{
			$('#new-item').val("");
			getItems();
		},
		fail: (err)=>{
			console.log(err)
		}
	})
})

const getItems = ()=>{
	$.ajax({
		url: '/items/j',
		method: 'GET',
		dataType: "JSON",
		success: printResults,
		fail: (err) =>{
			console.log(err)
		}
	})
}
printResults = (data) => {
	$('#items').empty();
	const theItems = data.items;
	data.items.forEach((item)=>{
		const $item = $('<li data-thisitem="' + item.id + '">')
		$item.text(item.title);
		$item.append($('<button data-action="delete">DELETE</button>'));
		$item.append($('<a href="#" data-action="edit">edit</a>'));
		$('#items').append($item)
	})
	console.log(data)
}



getItems();
