<cuisine>
  <div class="item">
    <h3 class="text-center typeName"><strong>{ cuisine.name }</strong></h3>
    <div>
      <img class="rounded img-responsive" src={ cuisine.src } alt="picture">
      <p class="text-center typeMeal">
        { cuisine.meal }
      </p>
      <p class="text-center typeTaste">
        { cuisine.taste }
      </p>
    </div>
  </div>

  <script>
    console.log('name', food.name);
  </script>

  <style>
    .item {
      border: 2px solid #ffe0cc;
      margin: 10px;
      padding: 5px;
    }
    img {
      margin-left: auto;
      margin-right:auto;
      display:block;
      max-height:30rem;

    }
    .typeName, .typeTaste,.typeMeal {
      font-family:Montserrat,sens-serif;
      font-size:2rem;
    }
  </style>

</cuisine>
