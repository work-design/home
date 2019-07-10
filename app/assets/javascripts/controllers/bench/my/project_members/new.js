$('#project_member_duty_id').dropdown({
  apiSettings: {
    url: '/admin/employees/search?q={query}'
  },
  fields: {
    name: 'real_name',
    value: 'id'
  },
  minCharacters: 3
});