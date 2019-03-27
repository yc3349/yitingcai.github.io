<menu>
  <!-- The menu page; after the foodpage -->
  <h1 class="text-center heading">
    Menus for {this.opts.food}
  </h1>
  <div class="item">
    <cuisine each={ cuisine in allMenus }></cuisine>
  </div>

    <button class="text-center button" type="button" onclick = { createmenu } >Create your own Menu!</button>


  <script>

    console.log(this.opts.food);

    var tag = this;
    this.allMenus = [];
    var rootFoodPath = "cuisineByFood/" + this.opts.food;
    console.log(rootFoodPath);

    var allMenuRef = database.ref(rootFoodPath);
    allMenuRef.on('value', function (snap) {
      var data = snap.val();

      tag.allMenus = [];
      for (menu in data) {
        tag.allMenus.push(data[menu]);
      };
      tag.update();
      console.log(tag.allMenus);
    })

    this.createmenu = function() {
      observable.trigger('addmenu');

    }
  </script>

  <style>
  .heading {
    font-family:Lobster, sens-serif;
    font-size:5rem;
    color:#ff8080;
  }
  .button {
    margin-left: auto;
    margin-right:auto;
    display:block;
    padding:5px 20px;
    font-family:lobster, sens-serif;
    font-size:3rem;
    background-color:#ffa366;
  }
  .button:hover {
    transition: background,.5s;
    background-color:#b34700;
    color:white;
  }
</style>

</menu>
