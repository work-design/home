$('#worker_duty_id').dropdown();
$('#worker_provider_id').dropdown({
  apiSettings: {
    url: '/providers/search?q={query}',
    beforeSend: function(settings) {
      return settings;
    }
  },
  fields: {
    name: 'name_detail',
    value: 'id'
  },
  minCharacters: 2
});


