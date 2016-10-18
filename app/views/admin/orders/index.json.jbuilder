json.current_page @admin_orders.current_page
json.total_pages @admin_orders.total_pages
json.array! @admin_orders, partial: 'admin/orders/admin_order', as: :admin_order