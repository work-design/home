function validRequired(self_dom) {
  if (!$(self_dom).parent().hasClass('error')) {
    $(self_dom).parent().addClass('error');
  }
}

function validPattern(self_dom) {
  if (!$(self_dom).parent().hasClass('error')) {
    $(self_dom).parent().addClass('error');
  }
}

function clearValid(self_dom) {
  $(self_dom).parent().removeClass('error');
}