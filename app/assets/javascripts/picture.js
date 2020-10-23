  // 写真複数投稿
  document.getElementById('post').addEventListener('click',(e)=>{
    e.preventDefault();
    document.getElementById('post_article').name = 'post_article'
    // formに強制的にpost_articleと任意の名前を付与
    // preventDefault()=クリックイベントを無効化。無効化しないと無条件にデータを送信
    var files = document.getElementById("article_image").files;
    // <div><h1>は全てElement。なので、article_imageという名前がついたid(Element)を呼び出す
    // lengthが選んだファイルの数。lengthで数え上げている。filesがhtml上の選択ボックスのtype
    if(files.length>3){
      alert('画像ファイルは3枚以内で投稿して下さい')
    }
    else{
       document.post_article.submit()
    }
  });