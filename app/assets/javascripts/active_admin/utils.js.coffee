jQuery ->
      $('#product_id').parent().hide()


      $('.order_items').on 'change', '#category_id',  ->
        products = $('#product_id').html()
        category = $('#category_id :selected').text()
        escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(products).filter("optgroup[label='#{escaped_category}']").html()

        if options
          $('#product_id').html(options)
          $('#product_id').parent().show()
        else
          $('#product_id').empty()
          # $('#product_id').parent().hide()
