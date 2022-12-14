<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

@import
	url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@500&display=swap')
	;

input[type=file]::file-selector-button {
  width: 7rem;
  height: 30px;
  background: #4e73df;
  color: white;
  border: 1px solid rgb(78,114,223);
  border-radius: 5px;
  cursor: pointer;
}	
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/all.min.js'></script>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script>
	var fonts = [ '?????? ??????', '??????', '??????', '??????', '?????????', '?????????', '?????? ??????', '??????',
			'?????????', '?????????', 'HY?????????', 'HY?????????', 'HY??????B', 'HY?????????M', 'HY????????????B',
			'HY?????????', 'HY????????????M', 'HY??????L', 'HY??????M', 'HY?????????', 'HY????????????M', '???????????????',
			'????????????T', '???????????????', '????????????????????????', '???????????????', '????????????' ];
	$(document)
			.ready(
					function() {

						$('#summernote')
								.summernote(
										{
											height : 350,
											minHeight : null,
											maxHeight : null,
											lang : "ko-KR",
											tabsize : 2,
											focus : true,
											fontNames : fonts.sort(),
											fontSizes : [ '8', '9', '10', '11',
													'12', '14', '16', '18',
													'20', '22', '24', '28',
													'30', '36', '50', '72' ],
											imageTitle : {
												specificAltField : true,
											},
											popover : {
												image : [
														[
																'imageResize',
																[
																		'resizeFull',
																		'resizeHalf',
																		'resizeQuarter',
																		'resizeNone' ] ],
														[
																'float',
																[
																		'floatLeft',
																		'floatRight',
																		'floatNone' ] ],
														[
																'remove',
																[ 'removeMedia' ] ],
														[
																'custom',
																[ 'imageTitle' ] ], ],
												link : [ [
														'link',
														[ 'linkDialogShow',
																'unlink' ] ] ],
												table : [
														[
																'add',
																[
																		'addRowDown',
																		'addRowUp',
																		'addColLeft',
																		'addColRight' ] ],
														[
																'delete',
																[
																		'deleteRow',
																		'deleteCol',
																		'deleteTable' ] ], ],
												air : [
														[ 'color', [ 'color' ] ],
														[
																'font',
																[
																		'bold',
																		'underline',
																		'clear' ] ],
														[
																'para',
																[ 'ul',
																		'paragraph' ] ],
														[ 'table', [ 'table' ] ],
														[
																'insert',
																[ 'link',
																		'picture' ] ] ]
											},
											toolbar : [
													[ 'Font Style',
															[ 'fontname' ] ],
													[ 'fontsize',
															[ 'fontsize' ] ],
													[ 'style', [ 'style' ] ],
													[
															'style',
															[
																	'bold',
																	'italic',
																	'underline',
																	'strikethrough',
																	'clear' ] ],
													[
															'color',
															[ 'forecolor',
																	'color' ] ],
													[ 'table', [ 'table' ] ],
													[ 'para', [ 'paragraph' ] ],
													[ 'height', [ 'height' ] ],
													[
															'insert',
															[ 'picture',
																	'link',
																	'video' ] ],
													[ 'highlight',
															[ 'highlight' ] ],
													[
															'view',
															[ 'fullscreen',
																	'help' ] ] ],
											callbacks : {
												onImageUpload : function(files,
														editor, welEditable) { //?????? ???????????? ?????? ????????? ??????
													for (var i = files.length - 1; i >= 0; i--) {
														sendFile(files[i], this);
													}
												},
												onPaste : function(e) {
													var clipboardData = e.originalEvent.clipboardData;
													if (clipboardData
															&& clipboardData.items
															&& clipboardData.items.length) {
														var item = clipboardData.items[0];
														if (item.kind === 'file'
																&& item.type
																		.indexOf('image/') !== -1) {
															e.preventDefault();
														}
													}
												}
											}
										});
						//   $('#summernote').summernote('fontName', '?????? ??????');

						$('#board_subject').focus();
						/* ????????? ?????? ?????????	*/
						function sendFile(file, editor) {
							data = new FormData();
							data.append("file", file);
							data.append("ca", "no");
							$.ajax({
								data : data,
								type : "POST",
								url : "uploadSummernoteImageFile",
								contentType : false,
								processData : false,
								success : function(data) {
									//?????? ???????????? ????????? url??? ????????? ??????.
									$(editor).summernote('insertImage',
											data.url);
								}
							});
						}
					});
</script>
</head>
<style>
.btn_blue {
	text-align: center;
}
</style>

<body>

	<form method='post' action='insert.no' enctype='multipart/form-data'>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary" style="font-size: 20px; font-weight: 800;">???????????? ?????????</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th style="vertical-align: inherit; width: 11rem; font-size: 18px; font-weight: 800;">??????</th>
								<td><input type="text" name='title' title='??????'
									class='form-control form-control-user' style="vertical-align: inherit; width: 11rem; font-size: 18px; font-weight: 800;"></td>
							</tr>
							<tr>
								<th style="vertical-align: baseline; width: 11rem; font-size: 18px; font-weight: 800;">??????</th>
								<td><textarea id='summernote' name='content' title="??????"
										class='form-control form-control-user conten'
										style="vertical-align: baseline; width: 11rem; font-size: 18px; font-weight: 800;"></textarea></td>
							</tr>
							<tr>
								<th style="font-size: 18px; font-weight: 800; ">????????????</th>
								<td>
									<div class='align'>
										<label> <input type='file' name='file' multiple="multiple"
											id='attach-file'>
										</label> <span id='file-name'></span> <span id='preview'></span> <a
											id='delete-file'></a>
									</div>
								</td>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		<input type='hidden' name='writer' value='${loginInfo.name }'>
	</form>
	<div class='btn_blue' style='padding: 2rem;'>
		<a class='btn btn-primary' id='save'
			style="color: #fff; background-color: #2e59d9; border-color: #2653d4; font-size: 18px; font-weight: 800;">??????</a>
		<a class='btn btn-secondary' href='list.no' style="font-size: 18px; font-weight: 800;">??????</a>
	</div>
	<script>
		$('#save').click(function() {
			if (emptyCheck())
				$('form').submit();
		});

		function emptyCheck() {
			var ok = true;
			$('.chk').each(
					function() {
						if ($(this).val() == '') {
							var item = $(this).attr('placeholder') ? $(this)
									.attr('placeholder') : $(this)
									.attr('title');
							alert(item + ' ???????????????!');
							$(this).focus();
							ok = false;
							return ok;
						}
					});
			return ok;
		}
	</script>


</body>




</html>