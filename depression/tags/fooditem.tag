<fooditem>
  <!-- food-lists on the first page -->
  <div onclick={ clickfood }>
    <h1 class="text-center foodItem">
      {food.name}
    </h1>
    <img src={food.src}>
  </div>

  <script>

    var that = this;
    console.log('elfood');

    this.clickfood = function (e) {
      console.log('clicked');
      var foodName = that.food.name
      observable.trigger('clickfood', foodName);
    }

  </script>

  <style>
  h1 {
  font-family:"Lobster",sens-serif;
}
  img {
    margin-left: auto;
    margin-right:auto;
    display:block;
    height:15em;
    width:20rem;
    border-radius:10em;
  }
  </style>

</fooditem>
