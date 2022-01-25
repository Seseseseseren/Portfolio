// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery.raty.js
//= require_tree .

/*global $*/
/*global location*/

$(document).on('turbolinks:load',function(){
  let starOn = $(".star-on").text();
  let starOff = $(".star-off").text();
  let starHalf = $(".star-half").text();

    $(`.star-rate`).raty({
    starOn:  starOn,
    starOff: starOff,
    starHalf: starHalf,
    half :true,
    readOnly: true,
    score: function(){
      return $(this).attr('data-review');
    }
    });
    $('#rate').raty({
      starOn:  starOn,
      starOff: starOff,
      starHalf: starHalf,
      half: true,
      scoreName: 'review[rate]',
    });
    
})
// 星評価の記述、.star-rateをクラスで指定しているため、ページ内の星の表示は全て上記の記述で完結