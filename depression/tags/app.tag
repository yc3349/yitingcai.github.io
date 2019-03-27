<app>
  <!-- This is the main tag -->

  <div>
    <foodpage foodType={ food } if={ this.showFoodList }></foodpage>
  </div>

  <div if={ this.showMenu }>
    <menu food={ food }>Menu</menu>
  </div>

  <addmenu if={ this.showAddMenu}></addmenu>

  <script>
    var that = this;
    this.showFoodList = true;
    this.showMenu = false;
    this.showAddMenu = false;
    this.food = null;

    observable.on('clickfood', function (food) {
      alert(food);
      that.showFoodList = false;
      that.showMenu = true;
      that.food = food;
      that.update();
    });

    observable.on('addmenu', function () {
      that.showMenu = false;
      that.showFoodList = false;
      that.showAddMenu = true;
      that.update();
    });

    observable.on('tofoodpage', function () {
      that.showMenu = false;
      that.showFoodList = true;
      that.showAddMenu = false;
      that.update();
    })

  </script>

</app>
