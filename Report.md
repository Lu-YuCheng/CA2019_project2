# CA-project2     Report
## Teammate
    B06902051    呂侑承
    B06902035    王靖傑
    B06902019    洪佳生
# Main steps
1.  Modify the previous project to support the new L1 cache and data memory

2.  Implement all the details of cache.

3.  Modify the pipeline registers so that they can stall while read/write miss.

# Work division
*   Step 1: 50% done by 呂侑承, while the other 50% done by 洪佳生

*   Step 2: 40% done by 呂侑承, 30% done by 洪佳生, while the other 30% done by 王靖傑 

*   Step 3: 20% done by 呂侑承, 40% done by 洪佳生, while the other 40% done by 王靖傑

# Program usage
*   Compile command: $ make

*   Execute compiled file: $ ./CPU.out

# How we implement this project
1.  The aim of this project is to support an off-chip data memory and a L1 data cache. Because the size of cache is smaller than main memory, read/write miss may happen and cause a 10 cycles stall of CPU.
2.  To deal with read/write miss, the cache must be able to detect read/write miss. Once a read/write miss occur, and the dirty bit is 1, we need to write back to the main memory(the policy is write back). 
3.  Because the write miss policy is write allocate, when a write miss occur, we need load block to cache, write on cache and set dirty bit.
4.  When cache is waiting for main memory to load data, it tells all pipeline registers to stall(stall the pipeline). If the pipeline regitster receive the stall message, it just simply do nothing(which means that it is stall).


# Implementation of cache control
*   To decide whether it is a hit or miss, we compare the tags and see if the valid bit is 1.
*   If it is a hit, r_hit_data is the data from sram(i.e. sram_cache_data). If it is a miss, r_hit_data is the data from main memory(i.e. mem_data_i)
*   We fetch the wanting data by block addrees + offset.
*   There are 5 states in cache control:
1. STATE_IDLE: it means that it is waiting for request
2. STATE_MISS: switch to this state when a read/write miss occur, if dirty bit is 1, go to write_back state, if not, go to read_miss state.
3. STATE_READMISS: waiting for main memory to load the data to cache(takes 10 cycles), if it is done, it receive an ack from main memory, and load the data to sram. Once it has loaded the data, switch to READMISSOK state.
4. STATE_READMISSOK: just as its name, it means that the data has already been loaded to sram, then just switch to idle state again..
5. STATE_WRITEBACK: wait for main memory to send ack to cache control, once receive ack, switch to READMISS state.




# Encountered Problems
*   Trying to realize the mechanism of the intercommunication between cache and off-chip memory.
