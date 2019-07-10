//= require sortablejs
//= require_self

var el = document.getElementById('task_lists');
var sortable = new Sortable(el, {
  group: 'name',
  sort: true,
  delay: 0,
  disabled: false,
  store: null,
  animation: 150,
  filter: ".ignore-elements",
  draggable: '.item',
  ghostClass: "sortable-ghost",
  chosenClass: "sortable-chosen",
  dataIdAttr: 'data-id',

  forceFallback: false,
  fallbackClass: "sortable-fallback",
  fallbackOnBody: false,

  scroll: true,
  scrollSensitivity: 30,
  scrollSpeed: 10,

  setData: function (dataTransfer, dragEl) {
    dataTransfer.setData('Text', dragEl.textContent);
  },

  onStart: function (evt){
  },

  onEnd: function (evt) {
    window.xxevt = evt;
    if (evt.oldIndex == evt.newIndex) {
      return
    }
    var url = '/my/tasks/' + evt.item.getAttribute('data-id') + '/reorder';
    var params = {
      method: 'PATCH',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.head.querySelector("[name=csrf-token]").content
      },
      body: JSON.stringify({
        sort_array: this.toArray(),
        old_index: evt.oldIndex,
        new_index: evt.newIndex
      }),
    };
    fetch(url, params).then(function(response) {
      return response.json()
    }).then(function(response) {
      console.log(response)
    })
  },

  onAdd: function (evt) {
    var itemEl = evt.item;
    evt.from;
  },

  onUpdate: function (evt) {
    var itemEl = evt.item;
  },

  onSort: function (evt) {

  },

  onRemove: function (evt) {

  },

  onFilter: function (evt) {
    var itemEl = evt.item;  // HTMLElement receiving the `mousedown|tapstart` event.
  },

  onMove: function (evt) {
    evt.dragged; // dragged HTMLElement
    evt.draggedRect; // TextRectangle {left, top, right и bottom}
    evt.related; // HTMLElement on which have guided
    evt.relatedRect; // TextRectangle
  }
});

