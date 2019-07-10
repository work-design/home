attachToInput({
  input: 'proxy',
  fileInput: 'file_input',
  uploadUrl: '/my/user',
  uploadFieldName: 'user[avatar]',
  extraParams: {
    token: '',
    _method: 'patch'
  },
  extraHeaders: {
    'Accept': 'application/json',
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  },
  onFileUploaded: function(filename) {
    $('#avatar_image').attr('src', filename);
  }
});



