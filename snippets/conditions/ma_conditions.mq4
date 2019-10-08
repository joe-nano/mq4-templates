// MA Conditions v1.0

#ifndef MAConditions_IMP
#define MAConditions_IMP

#include <ABaseCondition.mq4>

class MAAbovePriceCondition : public ABaseCondition
{
   ENUM_MA_METHOD _method;
   int _period;
public:
   MAAbovePriceCondition(const string symbol, ENUM_TIMEFRAMES timeframe, ENUM_MA_METHOD method, int period)
      :ABaseCondition(symbol, timeframe)
   {
      _method = method;
      _period = period;
   }

   bool IsPass(const int period)
   {
      double maValue = iMA(_symbol, _timeframe, _period, 0, _method, PRICE_CLOSE, period);
      return maValue > iClose(_symbol, _timeframe, period);
   }
};

class MABelowPriceCondition : public ABaseCondition
{
   ENUM_MA_METHOD _method;
   int _period;
public:
   MABelowPriceCondition(const string symbol, ENUM_TIMEFRAMES timeframe, ENUM_MA_METHOD method, int period)
      :ABaseCondition(symbol, timeframe)
   {
      _method = method;
      _period = period;
   }

   bool IsPass(const int period)
   {
      double maValue = iMA(_symbol, _timeframe, _period, 0, _method, PRICE_CLOSE, period);
      return maValue < iClose(_symbol, _timeframe, period);
   }
};

class MAAboveMACondition : public ABaseCondition
{
   ENUM_MA_METHOD _method1;
   int _period1;
   ENUM_MA_METHOD _method2;
   int _period2;
public:
   MAAboveMACondition(const string symbol, ENUM_TIMEFRAMES timeframe, ENUM_MA_METHOD method1, int period1
      , ENUM_MA_METHOD method2, int period2)
      :ABaseCondition(symbol, timeframe)
   {
      _method1 = method1;
      _period1 = period1;
      _method2 = method2;
      _period2 = period2;
   }

   bool IsPass(const int period)
   {
      double ma1Value = iMA(_symbol, _timeframe, _period1, 0, _method1, PRICE_CLOSE, period);
      double ma2Value = iMA(_symbol, _timeframe, _period2, 0, _method2, PRICE_CLOSE, period);
      return ma1Value > ma2Value;
   }
};

class MABelowMACondition : public ABaseCondition
{
   ENUM_MA_METHOD _method1;
   int _period1;
   ENUM_MA_METHOD _method2;
   int _period2;
public:
   MABelowMACondition(const string symbol, ENUM_TIMEFRAMES timeframe, ENUM_MA_METHOD method1, int period1
      , ENUM_MA_METHOD method2, int period2)
      :ABaseCondition(symbol, timeframe)
   {
      _method1 = method1;
      _period1 = period1;
      _method2 = method2;
      _period2 = period2;
   }

   bool IsPass(const int period)
   {
      double ma1Value = iMA(_symbol, _timeframe, _period1, 0, _method1, PRICE_CLOSE, period);
      double ma2Value = iMA(_symbol, _timeframe, _period2, 0, _method2, PRICE_CLOSE, period);
      return ma1Value < ma2Value;
   }
};
#endif