var project_id = document.querySelector('form').dataset['project_id'];
var search_url = '/my/projects/' + project_id + '/repos'

$('#project_github_repo_select').dropdown({
  apiSettings: {
    url: search_url + '?q={query}',
    beforeSend: function(settings) {
      return settings;
    }
  },
  fields: {
    name: 'full_name',
    value: 'full_name'
  },
  filterRemoteData: false,
  saveRemoteData: true
});