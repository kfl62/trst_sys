/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

tinyMCE.init({
  mode : "textareas",
  editor_deselector : "no_edit",
  theme : "advanced",
  theme_advanced_toolbar_location : "top",
  theme_advanced_toolbar_align : "left",
  plugins : "xhtmlxtras, advlink, style",
  theme_advanced_buttons1_add : "styleprops,cite,ins,del,abbr,acronym",
  theme_advanced_buttons2_add : "|, hr, removeformat, visualaid, |, sub, sup, |, charmap ",
  theme_advanced_buttons3 : ""
});
