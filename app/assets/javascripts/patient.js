$("[rel='tooltip']").tooltip();    

$('.thumbnail').hover(
	function(){
        $(this).find('.caption').slideDown(250); //.fadeIn(250)
    },
    function(){
        $(this).find('.caption').slideUp(250); //.fadeOut(205)
    }
); 

// // jQuery ->
// //         $('#tblpatients').dataTable()
// //         sPaginationType: "full_numbers"
// //         bJQueryUI: true
// //         bProcessing: true
// //         bServerSide: true
// //         sAjaxSource: $('#tblpatients').data('source')

jQuery(function($) {
$('#tblpatients').DataTable({
	sPaginationType: "full_numbers",
	bJqueryUI: true
	});
  // ajax: ...,
  // autoWidth: false,
  // processing: true,
  // serverSide: true,

  // Optional, if you want full pagination controls.
  // Check dataTables documentation to learn more about available options.
  // http://datatables.net/reference/option/pagingType
});