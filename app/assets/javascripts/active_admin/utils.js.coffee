jQuery ->
      $('#product_id').parent().hide()


      $('.order_items').on 'change', '#category_id',  ->
        products = $('#product_id').html()
        console.log('fff')
        category = $('#category_id :selected').text()
        escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        console.log($('#product_id').html())
        options = $(products).filter("optgroup[label='#{escaped_category}']").html()
        console.log(options)
        if options
          $('#product_id').html(options)
          $('#product_id').parent().show()
        else
          $('#product_id').empty()
          # $('#product_id').parent().hide()
