module BooksHelper

      def readtime?(book)
        if !book.characount.nil? then
          if book.characount/400 < 5 then
            '<div class="tag">5分以下</div>'
          elsif book.characount/400 < 15 then
            '<div class="tag">15分以下</div>'
          elsif book.characount/400 < 30 then
            '<div class="tag">30分以下</div>'
          elsif book.characount/400/60 < 1 then
            '<div class="tag">1時間以下</div>'
          elsif book.characount/400/60 < 2 then
            '<div class="tag">2時間以下</div>'
          elsif book.characount/400/60 < 3 then
            '<div class="tag">3時間以下</div>'
          else
            '<div class="tag">3時間以上</div>'
          end
        end
      end

      def rating?(book)
        if book.ranking < 100 then
          '<div class="star-rating"> <div class="star-rating-item" style="width:100%;"></div></div>'
        elsif book.ranking < 300 then
          '<div class="star-rating"> <div class="star-rating-item" style="width:75%;"></div></div>'
        elsif book.ranking < 500 then
          '<div class="star-rating"> <div class="star-rating-item" style="width:50%;"></div></div>'
        else
          '<div class="star-rating"> <div class="star-rating-item" style="width:0%;"></div></div>'
        end
      end


end
