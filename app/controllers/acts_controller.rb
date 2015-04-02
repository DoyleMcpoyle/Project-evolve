class ActsController < ApplicationController
  def index
    @acts_by_category = {
      "kindness" => ActiveSupport::JSON.decode(cookies["kindness"] || "[]"),
      "fear" => ActiveSupport::JSON.decode(cookies["fear"] || "[]"),
      "yourself" => ActiveSupport::JSON.decode(cookies["yourself"] || "[]")
    }

    if params["category"]
      if @acts_by_category[params["category"]].size < 3
        @acts_by_category[params["category"]].push(
          Act.where(category: params["category"])
             .where("act not in (?)", @acts_by_category[params["category"]].join(','))
             .order("RANDOM()")
             .first
             .act
        )
      end

      cookies[params["category"]] = ActiveSupport::JSON.encode(@acts_by_category[params["category"]])
    end
  end

  def result
  end
end
