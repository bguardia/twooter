// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

function addLikeEvents(){
    var like_links = document.querySelectorAll("a[data-remote]")
    var unlike_links = document.querySelectorAll("a.unlike_link")
    
    console.log("iterating through like_links");
    for(let i = 0; i < like_links.length; i++){
        console.log("i: " + i);
        let like_link = like_links[i];
        like_links[i].addEventListener("ajax:success", () => {
            toggleLike(like_link)
        });
    }

}

function toggleLike(el){
  console.log("called toggleLike.");
  var twoot_id = el.getAttribute("data-twoot-id");
  let els = document.querySelectorAll("[data-twoot-id='"+twoot_id+"']");

  els.forEach((element)=>{
    var like_icon = element.getElementsByTagName("i")[0];
    if(element.className.indexOf("unlike_link") >= 0){
      element.className = element.className.replace("unlike_link", "like_link");
      element.setAttribute("data-method", "post");
      element.setAttribute("href", "/like/twoot")
      element.setAttribute("data-params", "twoot_id="+twoot_id);
      like_icon.className = "far fa-heart";
    }else{
      element.className = element.className.replace("like_link", "unlike_link");
      element.setAttribute("data-method", "delete");
      element.setAttribute("href", "/unlike/twoot/"+twoot_id);
      element.setAttribute("data-params", "");
      like_icon.className = "fas fa-heart";
  }});
  
}

window.addEventListener("turbolinks:load", () => {
    addLikeEvents()});

Rails.start()
Turbolinks.start()
ActiveStorage.start()