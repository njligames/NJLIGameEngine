//
//  SteeringBehaviorObstacleAvoidanceBuilder.h
//  NJLIGameEngine_iOS
//
//  Created by James Folk on 5/5/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

#ifndef SteeringBehaviorObstacleAvoidanceBuilder_hpp
#define SteeringBehaviorObstacleAvoidanceBuilder_hpp

#pragma mark Header

#include "AbstractBuilder.h"
#include "Util.h"
#include "btAlignedObjectArray.h"
#include "btSerializer.h"
#include "lua.hpp"

#include "Log.h"

namespace njli
{
  /**
   *  Builder for <#CLASS#>
   */
  ATTRIBUTE_ALIGNED16(class)
  SteeringBehaviorObstacleAvoidanceBuilder : public AbstractBuilder
  {
    friend class WorldFactory;

  protected:
    SteeringBehaviorObstacleAvoidanceBuilder();
    SteeringBehaviorObstacleAvoidanceBuilder(
        const SteeringBehaviorObstacleAvoidanceBuilder &);
    BT_DECLARE_ALIGNED_ALLOCATOR();
    virtual ~SteeringBehaviorObstacleAvoidanceBuilder();

    SteeringBehaviorObstacleAvoidanceBuilder &operator=(
        const SteeringBehaviorObstacleAvoidanceBuilder &);

  public:
    /**
     *  Calculate the buffer size of this object.
     *
     *  @return The buffer size.
     */
    virtual s32 calculateSerializeBufferSize() const;
    /**
     *  Serialize this object.
     *
     *  @param btSerializer the serializer which does the serialize.
     */
    virtual void serialize(void *, btSerializer *) const;

    /**
     *  Get the type of ::jliObjectEnumType enum value, which this builder
     * builds.
     *
     *  @return The ::jliObjectEnumType enum value.
     */
    virtual u32 getObjectType() const;
    /**
     *  The name of this class.
     *
     *  @return The name of this class.
     */
    virtual const char *getClassName() const;
    /**
     *  Get the type of ::jliObjectEnumType enum value.
     *
     *  @return The ::jliObjectEnumType enum value.
     */
    virtual s32 getType() const;
    /**
     *  The string value for this object, which can be used for debugging.
     *
     *  @return "The string value for this object.
     */
    operator std::string() const;

    /**
     *  Create an Array of instances of this class.
     *
     *  @param size The amount of elements in the array.
     *
     *  @return Pointer to the newly created array.
     */
    static SteeringBehaviorObstacleAvoidanceBuilder **createArray(
        const u32 size);
    /**
     *  Destroy an Array of this class type.
     *
     *  @param array The Pointer to the array to delete.
     */
    static void destroyArray(SteeringBehaviorObstacleAvoidanceBuilder * *array,
                             const u32 size = 0);
    /**
     *  Create an instance of this class.
     *
     *  @return Pointer to the newly created instance.
     */
    static SteeringBehaviorObstacleAvoidanceBuilder *create();
    /**
     *  Create a clone of an instance of this class.
     *
     *  @param object The object to clone.
     *
     *  @return Pointer to the newly created instance.
     */
    static SteeringBehaviorObstacleAvoidanceBuilder *clone(
        const SteeringBehaviorObstacleAvoidanceBuilder &object);
    /**
     *  Destroy an instance of this class.
     *
     *  @param object The object to destroy.
     */
    static void destroy(SteeringBehaviorObstacleAvoidanceBuilder * object);
    /**
     *  Load a lua table representation of this class. This is used for
     * JLIM.create(object).
     *
     *  @param object      The object to load.
     *  @param L           The current lua state.
     *  @param stack_index The stack index of the lua stack.
     */
    static void load(SteeringBehaviorObstacleAvoidanceBuilder & object,
                     lua_State * L, int stack_index);
    /**
     *  Get the type of ::jliObjectEnumType enum value.
     *
     *  @return The ::jliObjectEnumType enum value.
     */
    static u32 type();
  };
}

#endif /* SteeringBehaviorObstacleAvoidanceBuilder_hpp */
