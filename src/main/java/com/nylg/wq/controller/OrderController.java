package com.nylg.wq.controller;

import com.github.pagehelper.PageInfo;
import com.nylg.wq.pojo.*;
import com.nylg.wq.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private ScheduleService scheduleService;
    @Autowired
    private MovieServices movieServices;
    @Autowired
    private HallService hallService;
    @Autowired
    private CinemaService cinemaService;

    /**
     *通过id查询带分页
     */
    @RequestMapping("/findOrderById")
    @ResponseBody
    public Map findOrderById(@RequestParam(value = "page",required = false,defaultValue = "1") int page,
                             @RequestParam(value = "limit",required = false,defaultValue = "10") int limit,
                             @RequestParam(value = "orderId",required = false,defaultValue = "") String orderId,
                             @RequestParam(value = "orderState",required = false) int orderState){
        Map m = new HashMap();
        PageInfo<Order> orderPageInfo = orderService.findOrderPageByOrderId(page,limit,orderId,orderState);
        m.put("code",0);
        m.put("msg","");
        m.put("count",orderPageInfo.getTotal());
        m.put("data",orderPageInfo.getList());
        return m;
    }
    /**
     * 修改订单状态
     */
    @RequestMapping("/changeOrderStatue")
    @ResponseBody
    public Map changeOrderStatue(String orderId){
        Map m = new HashMap();
        Order order = orderService.selectByPrimaryKey(orderId);
        order.setOrderState(2);
        int i = orderService.updateByPrimaryKeySelective(order);
        if (i>0){
            m.put("msg","success");
        }else{
            m.put("msg","error");
        }
        return m;
    }


    /**
     * 退票
     */
    @RequestMapping("/returnForRefund")
    @ResponseBody
    public Map returnForRefund(String orderId){
        Map ret = new HashMap();
        //改变订单状态为0，减少票房，增加场次的座位数
        Order order = orderService.selectByPrimaryKey(orderId);
        order.setOrderState(0);
        int m = orderService.updateByPrimaryKeySelective(order);
        Schedule schedule = scheduleService.selectScheduleById(order.getScheduleId());
        Long movieId = schedule.getMovieId();
        int i = movieServices.delTotallTickets(order.getOrderPrice(),movieId);
        int j = scheduleService.addTicket(schedule.getScheduleId());
        if (m>0&&i>0&&j>0){
            ret.put("msg","success");
            return ret;
        }else{
            ret.put("msg","error");
        }

        return ret;

    }


    /**
     * 后台查看所有订单
     *
     */
    @RequestMapping(value = "/findOrdersByPage")
    @ResponseBody
    public Map findOrdersByPage(@RequestParam(value = "page",required = false,defaultValue = "1") int page,
                                @RequestParam(value = "limit",required = false,defaultValue = "10") int limit,
                                @RequestParam(value = "userName",required = false,defaultValue = "") String userName,
                                @RequestParam(value = "orderState",required = false,defaultValue = "2") int orderState){
        Map m = new HashMap();
        PageInfo<Order> orderPage = orderService.findPageByUserName(page,limit,userName,orderState);
        m.put("code",0);
        m.put("msg","");
        m.put("count",orderPage.getTotal());
        m.put("data",orderPage.getList());
        return m;

    }

    /**
     * 选择电影院
     * @param movieId
     * @param model
     * @return
     */
    @RequestMapping("/ByTickets")
    public String buyTickets(Long movieId, Model model){
        model.addAttribute("movieId",movieId);
        return "buyTickets";
    }

    /**
     * 选择座位
     * @param cinemaId
     * @param model
     * @return
     */
   @RequestMapping("/selectSeat")
    public String selectSeat(@RequestParam(value ="cinemaId" ) Long cinemaId,
                             @RequestParam(value = "movieId") Long movieId,
                             @RequestParam(value = "date") int date, Model model){
       model.addAttribute("cinemaId",cinemaId);
       model.addAttribute("movieId",movieId);
       model.addAttribute("date",date);
       return "selectSeat";

   }
   @RequestMapping("/buySeat")
    public String buySeat(@RequestParam(value = "schedule_id") Long scheduleId,Model model){
       model.addAttribute("scheduleId",scheduleId);
       return "buySeat";

   }
   @RequestMapping("/pay")
    public String pay(){
        return "pay";
   }

    /**
     * 购买电影票添加订单
     *
     *
     */
   @RequestMapping("/buyMovieTickets")
   @ResponseBody
   public Map<String,String> buyMovieTickets(@RequestParam(value ="scheduleId") Long scheduleId,
                                             @RequestParam(value = "position[]") String[] position,
                                             @RequestParam(value ="orderPrice" ) int orderPrice, HttpServletRequest request){
       //订单编号是根据uuid前八位+用户id位数的变化+座次
       Map<String,String> map = new HashMap<>();
       orderPrice = orderPrice/position.length;
       User user =(User) request.getSession().getAttribute("user");
       String id = String.valueOf(user.getUserId());
       String userId = "";
       String seat = "";
       int num = 0;
       switch (id.length()){
           case 1: userId = 0000+userId; break;
           case 2: userId = 000 + userId; break;
           case 3: userId = 00+ userId; break;
           case 4: userId = 0 + userId; break;
       }
       for (int i=0;i<position.length;i++){
           String uuid=user.getUserId()+ UUID.randomUUID().toString().replace("-", "").substring(0,8);
           Order order = new Order();
           String posit = position[i];
          switch (position[i].length()){
              case 4 :seat=0+posit.replace("排","0");
                      seat = seat.replace("座","0"); break;
             //第一种 1排11座
              case 5 : if (posit.charAt(2)>=48&&posit.charAt(2)<=57){
                  seat = 0+posit.replace("排","");
                  seat = seat.replace("座","");
                  break;
              }else{
                  //11排1座
                  seat = posit.replace("排","0");
                  seat=seat.replace("座","");
                  break;

              }
              case 6: seat = posit.replace("排","");
              seat = seat.replace("座","");
              break;
          }
          String orderId = uuid+userId+seat;
          order.setOrderPrice(orderPrice);
          order.setOrderId(orderId);
          order.setOrderPosition(posit);
          order.setUserId(user.getUserId());
           Calendar calendar=Calendar.getInstance();
           Date date=calendar.getTime();
           order.setOrderState(1);
           order.setOrderTime(date);
           order.setScheduleId(scheduleId);
          //添加订单，减少影厅剩余座位数
           int a = orderService.insertSelective(order);
           num++;
       }
       //减少场次座位
       int b = scheduleService.saleTicket(scheduleId,num);
       Schedule s = scheduleService.selectScheduleById(scheduleId);
       //修改电影票房
       int c = movieServices.updateTotallTickets(num*orderPrice,s.getMovieId());
        if (num==position.length && b >0 && c>0){
            //修改票房,通过movieid

            map.put("type","success");
            map.put("msg","购票成功");
            return map;

        }
           map.put("type","error");
           map.put("msg","购票失败，请联系管理员");
           return map;

   }
    /**
     * 付款状态
     */
    @RequestMapping("/payStatus")
    public String payStatus(){
        return "payStatus";
    }
    /**
     * 查看个人订单
     */
    @RequestMapping("/findMovieOrderByName")
    @ResponseBody
    public Map findMovieOrderByName(HttpServletRequest request){
        Map m = new HashMap();
        User u = (User) request.getSession().getAttribute("user");
        List<Order> orderList = orderService.findOrderByUserId(u.getUserId());
        for (Order o : orderList){
            Schedule schedule = scheduleService.selectScheduleById(o.getScheduleId());
            Hall hall = hallService.selectByPrimaryKey(schedule.getHallId());
            Cinema cinema = cinemaService.findCinemaById(hall.getCinemaId());
            Movie movie = movieServices.selectById(schedule.getMovieId());
            schedule.setScheduleHall(hall);
            schedule.setScheduleCinema(cinema);
            schedule.setScheduleMovie(movie);
            o.setSchedule(schedule);
        }
        m.put("orderList",orderList);

        return m;

    }
}
