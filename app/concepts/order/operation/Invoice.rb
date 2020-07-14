module Order::Operation
    class Invoice < Trailblazer::Operation
        
        step :get_user
        fail :user_not_find
        step :get_order
        fail :order_not_find
        step :calculate_total_amount
        step :calculate_delivery_charges
        step :calculate_grand_total

        def get_user(ctx, params:, **)
            ctx[:user] = User.find_by(id: params[:user_id])
        end

        def user_not_find(ctx, **)
            ctx[:error] = 'User not found ....'
        end

        def get_order(ctx, params:, **)
            ctx[:order] = ctx[:user].orders.find_by(id: params[:order_id])
        end

        def order_not_find(ctx, **)
            ctx[:error] = 'Order not found ....'
        end
        
        def calculate_total_amount(ctx, **)
            ctx[:order_total] = ctx[:order].order_details.joins(:item).sum('price').to_f
        end

        def calculate_delivery_charges(ctx, **)
            ctx[:delivery_charges] = if ctx[:order].self_pickup
                0
            else
                (5.0/100) * ctx[:order_total]
            end
        end

        def calculate_grand_total(ctx, **)
            ctx[:grand_total] = ctx[:order_total] + ctx[:delivery_charges] 
        end
    end
end