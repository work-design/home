$('#nation').dropdown({
  onChange: function(value, text, $selectedItem){
    var search_path = '/areas/search'
    var search_url = new URL(window.location.origin + search_path)
    search_url.searchParams.set('nation', value)
    fetch(search_url).then(function(response){
      return response.json();
    }).then(function(response){
      $('#province').dropdown('clear').dropdown('setup menu', response);
    })
  }
});

$('#province').dropdown({
  onChange: function(value, text, $selectedItem){
    var search_path = '/areas/search'
    var search_url = new URL(window.location.origin + search_path)
    search_url.searchParams.set('province', value)
    fetch(search_url).then(function(response){
      return response.json();
    }).then(function(response){
      $('#city').dropdown('clear').dropdown('setup menu', response);
    })
  }
});

$('#city').dropdown({
  onChange: function(value, text, $selectedItem){
    $('#space_area_id').val(value);
  }
});

$('#space_space_taxon_id').dropdown();